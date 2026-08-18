#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Send Arc Tab to Todoist & Close
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📥
# @raycast.packageName Arc + Todoist
# @raycast.description Creates a Todoist task from the active Arc tab (as a clickable link) and closes that tab. First run prompts for your Todoist API token (Todoist → Settings → Integrations → Developer → Copy API token) and saves it to Keychain — you won't be asked again. Only sends/closes when Arc is the frontmost app.

KEYCHAIN_SERVICE="todoist-api-token"

# --- 1. Get the Todoist API token from Keychain, or ask for it once ---
TOKEN=$(security find-generic-password -a "$USER" -s "$KEYCHAIN_SERVICE" -w 2>/dev/null)
if [ -z "$TOKEN" ]; then
  TOKEN=$(osascript -e 'text returned of (display dialog "Paste your Todoist API token:" & return & return & "(Todoist → Settings → Integrations → Developer → Copy API token)" default answer "" with title "Todoist Setup" with hidden answer buttons {"Cancel", "Save"} default button "Save")' 2>/dev/null)
  if [ -z "$TOKEN" ]; then
    echo "⚠️ No token entered — setup cancelled"
    exit 1
  fi
  security add-generic-password -a "$USER" -s "$KEYCHAIN_SERVICE" -w "$TOKEN" -U
  echo "✅ Token saved — press the hotkey again to send this tab"
  exit 0
fi

# --- 2. Require Arc to be the frontmost app ---
FRONTMOST=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)
if [ "$FRONTMOST" != "Arc" ]; then
  echo "⚠️ Arc isn't in the foreground — nothing sent"
  exit 1
fi

# --- 3. Get the active tab's title + URL from Arc ---
RESULT=$(osascript <<'APPLESCRIPT' 2>/dev/null
tell application "Arc"
	set theTitle to title of active tab of front window
	set theURL to URL of active tab of front window
end tell
return theTitle & (ASCII character 1) & theURL
APPLESCRIPT
)

if [ -z "$RESULT" ]; then
  echo "⚠️ Could not read the active Arc tab"
  exit 1
fi

TAB_TITLE="${RESULT%%$'\x01'*}"
TAB_URL="${RESULT#*$'\x01'}"

# --- 4. Build the Todoist task (title as a clickable markdown link) ---
escape_json() {
  local s="$1"
  s="${s//\\/\\\\}"
  s="${s//\"/\\\"}"
  printf '%s' "$s"
}

CONTENT="[$TAB_TITLE]($TAB_URL)"
JSON="{\"content\": \"$(escape_json "$CONTENT")\"}"

HTTP_STATUS=$(curl -s -o /tmp/todoist_response.json -w "%{http_code}" \
  "https://api.todoist.com/api/v1/tasks" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -X POST \
  --data "$JSON")

# --- 5. On success, close the tab. On failure, leave it open. ---
if [ "$HTTP_STATUS" -ge 200 ] && [ "$HTTP_STATUS" -lt 300 ]; then
  osascript -e 'tell application "System Events" to keystroke "w" using command down'
  echo "✅ Sent to Todoist: ${TAB_TITLE}"
elif [ "$HTTP_STATUS" -eq 401 ] || [ "$HTTP_STATUS" -eq 403 ]; then
  security delete-generic-password -a "$USER" -s "$KEYCHAIN_SERVICE" >/dev/null 2>&1
  echo "❌ Todoist rejected the token (HTTP $HTTP_STATUS) — cleared it, press hotkey again to re-enter"
  exit 1
else
  echo "❌ Todoist error (HTTP $HTTP_STATUS) — tab left open"
  exit 1
fi