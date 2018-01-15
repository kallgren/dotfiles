" Color scheme by Robert Källgren, based on:
"   base16-vim (https://github.com/chriskempson/base16-vim)
"   by Chris Kempson (http://chriskempson.com)
"   Classic Dark scheme by Jason Heeris (http://heeris.id.au)

" =============================== COLOR CHART ================================ "

" name     dark    light   adventurous  onedark  onelight  GraphiQL
" ------------------------------------------------------------------
" base00 - #151515 #FAFAFA #191B1F      #282C34  #FAFAFA  #FFFFFF
" base01 - #202020 #F0F0F0 #24272D      #2C323C  #F0F0F0  #EEEEEE
" base02 - #303030 #DADADA #373B41      #3E4452  #D0D0D0
" base03 - #404040 #B0B0B0              #5C6370  #A0A1A7  #999999
" base04 - #B0B0B0 #404040              #ABB2BF  #494B53
" base05 - #D0D0D0 #303030              #ABB2BF  #494B53  #555555
" base06 - #E0E0E0 #202020
" base07 - #F5F5F5 #151515
" base08 - #AC4142 #A22B18 #F25A55      #E06C75  #E45649  #A22B18  #E93323
" base09 - #D28445 #D28445 #DE935F      #D19A66  #986801
" base0A - #F4BF75 #C39A33 #F5BB12      #E5C07B  #C18401  #C39A33
" base0B - #90A959 #4B7C28 #4BAE16      #98C379  #50A14F  #4B7C28
" base0C - #75B5AA #387EC1 #8ABEB7      #56B6C2  #0184BC  #387EC1
" base0D - #6A9FB5 #33609B #277BD3      #61AFEF  #4078F2  #33609B
" base0E - #AA759F #7F32B1              #C678DD  #A626A4  #7F32B1  #C54D90
" base0F - #8F5536 #8F5536              #BE5046  #CA1243

" ============================ COLOR DEFINITIONS ============================= "

if &background == "dark"
  let s:gui00         = "151515"
  let s:gui01         = "202020"
  let s:gui02         = "303030"
  let s:gui03         = "404040"
  let s:gui04         = "B0B0B0"
  let s:gui05         = "D0D0D0"
  let s:gui06         = "E0E0E0"
  let s:gui07         = "F5F5F5"
  let s:gui08         = "AC4142"
  let s:gui09         = "D28445"
  let s:gui0A         = "F4BF75"
  let s:gui0B         = "90A959"
  let s:gui0C         = "75B5AA"
  let s:gui0D         = "6A9FB5"
  let s:gui0E         = "AA759F"
  let s:gui0F         = "8F5536"
  let g:base16_gui01  = "202020"
  let g:base16_gui08t = "321F1E" " #AC4142 with 19% transparency on #151515
  let g:base16_gui0Dt = "262F34" " #6A9FB5 with 19% transparency on #151515
else
  let s:gui00         = "FAFAFA"
  let s:gui01         = "F0F0F0"
  let s:gui02         = "DADADA"
  let s:gui03         = "B0B0B0"
  let s:gui04         = "404040"
  let s:gui05         = "303030"
  let s:gui06         = "202020"
  let s:gui07         = "151515"
  let s:gui08         = "A22B18"
  let s:gui09         = "D28445"
  let s:gui0A         = "C39A33"
  let s:gui0B         = "4B7C28"
  let s:gui0C         = "387EC1"
  let s:gui0D         = "33609B"
  let s:gui0E         = "7F32B1"
  let s:gui0F         = "8F5536"
  let g:base16_gui01  = "EAEAEA"
  let g:base16_gui08t = "F5DEDE"
  let g:base16_gui0Dt = "E1EDF3"
endif

" =============================== SCHEME SETUP =============================== "

hi clear
syntax reset
let g:colors_name = "kallgren"

" Highlighting function
function! g:Base16hi(group, guifg, guibg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=#" . a:guisp
  endif
endfunction

fun <sid>hi(group, guifg, guibg, attr, guisp)
  call Base16hi(a:group, a:guifg, a:guibg, a:attr, a:guisp)
endfun

" ================================== COLORS ================================== "

" Vim editor colors
call <sid>hi("Normal",        s:gui05, s:gui00, "", "")
call <sid>hi("Bold",          "", "", "bold", "")
call <sid>hi("Debug",         s:gui08, "", "", "")
call <sid>hi("Directory",     s:gui0D, "", "", "")
call <sid>hi("Error",         s:gui00, s:gui08, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, "", "")
call <sid>hi("Exception",     s:gui08, "", "", "")
call <sid>hi("FoldColumn",    s:gui0C, s:gui01, "", "")
call <sid>hi("Folded",        s:gui03, s:gui01, "", "")
call <sid>hi("IncSearch",     s:gui01, s:gui09, "none", "")
call <sid>hi("Italic",        "", "", "none", "")
call <sid>hi("Macro",         s:gui08, "", "", "")
call <sid>hi("MatchParen",    "", s:gui03, "", "")
call <sid>hi("ModeMsg",       s:gui0B, "", "", "")
call <sid>hi("MoreMsg",       s:gui0B, "", "", "")
call <sid>hi("Question",      s:gui0D, "", "", "")
call <sid>hi("Search",        s:gui03, s:gui0A, "", "")
call <sid>hi("Substitute",    s:gui03, s:gui0A, "none", "")
call <sid>hi("SpecialKey",    s:gui03, "", "", "")
call <sid>hi("TooLong",       s:gui08, "", "", "")
call <sid>hi("Underlined",    s:gui08, "", "underline", "")
call <sid>hi("Visual",        "", s:gui02, "", "")
call <sid>hi("VisualNOS",     s:gui08, "", "underline", "")
call <sid>hi("WarningMsg",    s:gui08, "", "", "")
call <sid>hi("WildMenu",      s:gui08, s:gui0A, "", "")
call <sid>hi("Title",         s:gui09, "", "none", "")
call <sid>hi("Conceal",       s:gui0D, s:gui00, "", "")
call <sid>hi("Cursor",        s:gui00, s:gui05, "", "")
call <sid>hi("NonText",       s:gui03, "", "", "")
call <sid>hi("LineNr",        s:gui03, s:gui00, "", "")
call <sid>hi("SignColumn",    s:gui03, s:gui00, "", "")
call <sid>hi("StatusLine",    s:gui04, s:gui01, "bold", "")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, "none", "")
call <sid>hi("VertSplit",     s:gui02, s:gui00, "none", "")
call <sid>hi("ColorColumn",   "", s:gui01, "none", "")
call <sid>hi("CursorColumn",  "", s:gui01, "none", "")
call <sid>hi("CursorLine",    "", s:gui01, "none", "")
call <sid>hi("CursorLineNr",  s:gui04, s:gui01, "", "")
call <sid>hi("QuickFixLine",  "", s:gui01, "none", "")
call <sid>hi("PMenu",         s:gui05, s:gui01, "none", "")
call <sid>hi("PMenuSel",      s:gui01, s:gui05, "", "")
call <sid>hi("TabLine",       s:gui03, s:gui00, "none", "")
call <sid>hi("TabLineFill",   s:gui03, s:gui00, "none", "")
call <sid>hi("TabLineSel",    s:gui0D, s:gui00, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", "", "")
call <sid>hi("Character",    s:gui08, "", "", "")
call <sid>hi("Comment",      s:gui03, "", "", "")
call <sid>hi("Conditional",  s:gui0E, "", "", "")
call <sid>hi("Constant",     s:gui09, "", "", "")
call <sid>hi("Define",       s:gui0E, "", "none", "")
call <sid>hi("Delimiter",    s:gui0F, "", "", "")
call <sid>hi("Float",        s:gui09, "", "", "")
call <sid>hi("Function",     s:gui0D, "", "", "")
call <sid>hi("Identifier",   s:gui08, "", "none", "")
call <sid>hi("Include",      s:gui0D, "", "", "")
call <sid>hi("Keyword",      s:gui0E, "", "", "")
call <sid>hi("Label",        s:gui0A, "", "", "")
call <sid>hi("Number",       s:gui09, "", "", "")
call <sid>hi("Operator",     s:gui05, "", "none", "")
call <sid>hi("PreProc",      s:gui0A, "", "", "")
call <sid>hi("Repeat",       s:gui0A, "", "", "")
call <sid>hi("Special",      s:gui0C, "", "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", "", "")
call <sid>hi("Statement",    s:gui08, "", "", "")
call <sid>hi("StorageClass", s:gui0A, "", "", "")
call <sid>hi("String",       s:gui0B, "", "", "")
call <sid>hi("Structure",    s:gui0E, "", "", "")
call <sid>hi("Tag",          s:gui0A, "", "", "")
call <sid>hi("Todo",         s:gui0A, s:gui01, "", "")
call <sid>hi("Type",         s:gui0A, "", "underline", "")
call <sid>hi("Typedef",      s:gui0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", "", "")
call <sid>hi("cPreCondit",  s:gui0E, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:gui0A, "", "", "")
call <sid>hi("csAttribute",             s:gui0A, "", "", "")
call <sid>hi("csModifier",              s:gui0E, "", "", "")
call <sid>hi("csType",                  s:gui08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:gui0D, "", "", "")
call <sid>hi("csContextualStatement",   s:gui0E, "", "", "")
call <sid>hi("csNewDecleration",        s:gui08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "", "", "")
call <sid>hi("cssClassName",   s:gui0E, "", "", "")
call <sid>hi("cssColor",       s:gui0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0B, s:gui01,  "", "")
call <sid>hi("DiffChange",   s:gui03, s:gui01,  "", "")
call <sid>hi("DiffDelete",   s:gui08, s:gui01,  "", "")
call <sid>hi("DiffText",     s:gui0D, s:gui01,  "", "")
call <sid>hi("DiffAdded",    s:gui0B, s:gui00,  "", "")
call <sid>hi("DiffFile",     s:gui08, s:gui00,  "", "")
call <sid>hi("DiffNewFile",  s:gui0B, s:gui00,  "", "")
call <sid>hi("DiffLine",     s:gui0D, s:gui00,  "", "")
call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:gui08, "", "", "")
call <sid>hi("gitcommitSummary",        s:gui0B, "", "", "")
call <sid>hi("gitcommitComment",        s:gui03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:gui03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:gui03, "", "", "")
call <sid>hi("gitcommitSelected",       s:gui03, "", "", "")
call <sid>hi("gitcommitHeader",         s:gui0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:gui0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:gui0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:gui0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:gui09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:gui0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:gui08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:gui08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:gui0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui0B, s:gui00, "", "")
call <sid>hi("GitGutterChange",  s:gui0D, s:gui00, "", "")
call <sid>hi("GitGutterDelete",  s:gui08, s:gui00, "", "")
call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui00, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "", "", "")
call <sid>hi("htmlItalic",  s:gui0E, "", "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", "", "")
call <sid>hi("htmlTag",     s:gui05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", "", "")
call <sid>hi("javaScriptBraces",  s:gui05, "", "", "")
call <sid>hi("javaScriptNumber",  s:gui09, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:gui0D, "", "", "")
call <sid>hi("jsStatement",         s:gui0E, "", "", "")
call <sid>hi("jsReturn",            s:gui0E, "", "", "")
call <sid>hi("jsThis",              s:gui08, "", "", "")
call <sid>hi("jsClassDefinition",   s:gui0A, "", "", "")
call <sid>hi("jsFunction",          s:gui0E, "", "", "")
call <sid>hi("jsFuncName",          s:gui0D, "", "", "")
call <sid>hi("jsFuncCall",          s:gui0D, "", "", "")
call <sid>hi("jsClassFuncName",     s:gui0D, "", "", "")
call <sid>hi("jsClassMethodType",   s:gui0E, "", "", "")
call <sid>hi("jsRegexpString",      s:gui0C, "", "", "")
call <sid>hi("jsGlobalObjects",     s:gui0A, "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:gui0A, "", "", "")
call <sid>hi("jsExceptions",        s:gui0A, "", "", "")
call <sid>hi("jsBuiltins",          s:gui0A, "", "", "")
call <sid>hi("jsObjectKey",         s:gui08, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:gui0A, "", "", "")
call <sid>hi("mailQuoted2",  s:gui0B, "", "", "")
call <sid>hi("mailQuoted3",  s:gui0E, "", "", "")
call <sid>hi("mailQuoted4",  s:gui0C, "", "", "")
call <sid>hi("mailQuoted5",  s:gui0D, "", "", "")
call <sid>hi("mailQuoted6",  s:gui0A, "", "", "")
call <sid>hi("mailURL",      s:gui0D, "", "", "")
call <sid>hi("mailEmail",    s:gui0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", "", "")
call <sid>hi("markdownError",             s:gui05, s:gui00, "", "")
call <sid>hi("markdownCodeBlock",         s:gui0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", "", "")
call <sid>hi("markdownListMarker",        s:gui0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", "", "")
call <sid>hi("phpComparison",      s:gui05, "", "", "")
call <sid>hi("phpParent",          s:gui05, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", "", "")
call <sid>hi("pythonRepeat",    s:gui0E, "", "", "")
call <sid>hi("pythonInclude",   s:gui0E, "", "", "")
call <sid>hi("pythonStatement", s:gui0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", "", "")
call <sid>hi("rubyConstant",                s:gui0A, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", "", "")
call <sid>hi("sassClassChar",  s:gui09, "", "", "")
call <sid>hi("sassInclude",    s:gui0E, "", "", "")
call <sid>hi("sassMixing",     s:gui0E, "", "", "")
call <sid>hi("sassMixinName",  s:gui0D, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:gui01, "", "")
call <sid>hi("SignifySignChange",  s:gui0D, s:gui01, "", "")
call <sid>hi("SignifySignDelete",  s:gui08, s:gui01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:gui00, "undercurl", s:gui08)
call <sid>hi("SpellLocal",   "", s:gui00, "undercurl", s:gui0C)
call <sid>hi("SpellCap",     "", s:gui00, "undercurl", s:gui0D)
call <sid>hi("SpellRare",    "", s:gui00, "undercurl", s:gui0E)

" Startify highlighting
call <sid>hi("StartifyBracket",  s:gui03, "", "", "")
call <sid>hi("StartifyFile",     s:gui07, "", "", "")
call <sid>hi("StartifyFooter",   s:gui03, "", "", "")
call <sid>hi("StartifyHeader",   s:gui0B, "", "", "")
call <sid>hi("StartifyNumber",   s:gui09, "", "", "")
call <sid>hi("StartifyPath",     s:gui03, "", "", "")
call <sid>hi("StartifySection",  s:gui0E, "", "", "")
call <sid>hi("StartifySelect",   s:gui0C, "", "", "")
call <sid>hi("StartifySlash",    s:gui03, "", "", "")
call <sid>hi("StartifySpecial",  s:gui03, "", "", "")

" ================================= CLEANUP ================================== "

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
