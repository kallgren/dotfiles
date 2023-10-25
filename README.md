# Kallgren's dotfiles 🙃

## Setup

`git clone git@github.com:kallgren/dotfiles.git ~`

### Applications

1. Install [Homebrew](https://brew.sh/)
2. `cd ~/dotfiles`
3. `brew bundle` (Installs applications listed in [Brewfile](Brewfile))
4. Configure BetterTouchTool, Monitor Control and Flux to run at startup

### Terminal
1. Install [Oh My ZSH!](https://ohmyz.sh/)
2. `ln -s ~/dotfiles/.zshrc ~`

### Legacy iTerm2 + Tmux + Vim setup

1. [iTerm2](https://www.iterm2.com/)
2. [Monaco Nerd Font](https://github.com/taohex/font/blob/master/Monaco%20for%20Powerline%20Nerd%20Font%20Complete.otf)
6. `brew install vim` (Apple's shipped `vim` version may not have the `termguicolors` feature enabled)
8. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
9. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
11. `ln -s ~/dotfiles/.vimrc ~/dotfiles/.tmux.conf ~`
12. `mkdir -p ~/.vim/colors && cp ~/dotfiles/colors/kallgren.vim "$_"`
13. Open and configure iTerm2:
    1. Switch to _Monaco Nerd Font_ installed earlier
    2. Create separate profiles for the dark and light theme and import the _.itermcolors_ files
    3. Add custom keybindings to toggle between the profiles! (<kbd>Ctrl</kbd> + <kbd>Cmd</kbd> + <kbd>k</kbd>/<kbd>l</kbd>)
14. Fire up `tmux` + `vim`
15. Install vim plugins by running `:PluginInstall` inside vim
16. Install tmux plugins by pressing _prefix_ (<kbd>Ctrl</kbd> + <kbd>Space</kbd>), <kbd>I</kbd>
17. Done! ✌️ Switch between the light and dark color themes in vim, tmux and iterm2 at once from within vim with the single key binding <kbd>,</kbd><kbd>b</kbd><kbd>g</kbd>

### VS Code

1. `ln -s ~/dotfiles/.vscode/settings.json ~/dotfiles/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/`
2. Open up this repository with VS Code and install any relevant recommended extensions

### BetterTouchTool

1. Import _kallgren.bttpreset_
2. Adjust trackpad rotate gesture settings (for knob-style volume control) (because it is not included in settings export): 
    - _Rotate block time_: 0.01
    - _Set needed rotation amount (degree)_: ~3

The preset includes:
- App toggle keybindings (on left hand on my keyboard) for commonly used applications, using <kbd>Hyper</kbd> (<kbd>Shift</kbd> + <kbd>Ctrl</kbd> + <kbd>Option</kbd> + <kbd>Command</kbd>)
- Window management keybindings (on right hand on my keyboard) using <kbd>Hyper</kbd> with logical placements (exploiting symbol combos to extend options, and using num layer for more complex or specific window configurations, see ZMK config)
- Touch gestures for volume and brightness control
- Clipboard history on <kbd>Hyper</kbd> + <kbd>v</kbd>

### macOS

- Setup <kbd>Alt</kbd> + <kbd>Tab</kbd> to toggle windows within application

### Keyboard

- Ferris Sweep: flash [ZMK firmware](https://github.com/kallgren/zmk-config)