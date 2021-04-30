# Kallgren's dotfiles 🙃

![Dark theme](screenshots/2018-01-15-dark.png "Dark theme screenshot")
![Light theme](screenshots/2018-01-15-light.png "Light theme screenshot")
![Minimal Vim dark](screenshots/2018-01-15-minimal-vim-dark.png "Minimal Vim screenshot dark")
![Minimal Vim light](screenshots/2018-01-15-minimal-vim-light.png "Minimal Vim screenshot light")
![Vim Goyo markdown dark](screenshots/2018-01-15-vim-goyo-dark.png "Vim Goyo markdown screenshot dark")
![Vim Goyo markdown light](screenshots/2018-01-15-vim-goyo-light.png "Vim Goyo markdown screenshot light")

## Setup

### Term & Vim

1. [iTerm2](https://www.iterm2.com/)
2. [Monaco Nerd Font](https://github.com/taohex/font/blob/master/Monaco%20for%20Powerline%20Nerd%20Font%20Complete.otf)
3. [Homebrew](https://brew.sh/)
4. [Oh My ZSH!](https://ohmyz.sh/)
5. [Pure](https://github.com/sindresorhus/pure)
6. `brew install vim` (Apple's shipped `vim` version may not have the `termguicolors` feature enabled)
7. `brew install tmux`
8. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
9. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
10. `git clone git@github.com:kallgren/dotfiles.git ~`
11. `ln -s ~/dotfiles/.vimrc ~/dotfiles/.tmux.conf ~/dotfiles/.zshrc ~`
12. `mkdir -p ~/.vim/colors && cp ~/dotfiles/colors/kallgren.vim "$_"`
13. Open and configure iTerm2:
    1. Switch to _Monaco Nerd Font_ installed earlier
    2. Create separate profiles for the dark and light theme and import the _.itermcolors_ files
    3. Add custom keybindings to toggle between the profiles! (<kbd>Ctrl</kbd> + <kbd>Cmd</kbd> + <kbd>k</kbd>/<kbd>l</kbd>)
    4. Enable hotkey to quickly show/hide terminal (<kbd>Alt</kbd> + <kbd>Space</kbd>)
14. Fire up `tmux` + `vim`
15. Install vim plugins by running `:PluginInstall` inside vim
16. Install tmux plugins by pressing _prefix_ (<kbd>Ctrl</kbd> + <kbd>Space</kbd>), <kbd>I</kbd>
17. Done! ✌️ Switch between the light and dark color themes in vim, tmux and iterm2 at once from within vim with the single key binding <kbd>,</kbd><kbd>b</kbd><kbd>g</kbd>

### VS Code

1. [Download](https://code.visualstudio.com/)
2. `ln -s ~/dotfiles/.vscode/settings.json ~/dotfiles/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/`
3. Create an _App Shortcut_ for VS Code inside macOS keyboard preferences: _Code->Hide Visual Studio Code_ (<kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd>)
4. Download [Quicksilver](https://qsapp.com/), change its default activation shortcut to not replace macOS spotlight (<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Space</kbd>) and set up a Quicksilver trigger to open VS Code with the same key combination as the App Shortcut (<kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd>) _(macOS' built-in support for opening apps using services created in Automator has delay and is unreliable)_. Then configure Quicksilver to disable the trigger once inside VS Code so that it won't interfere with the App Shortcut.
5. Open up this repository with VS Code and install the recommended extensions

### Bear

1. [Download](https://bear.app/)
2. Enable global shortcut to quickly show/hide in Bear's preferences (<kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd>)
