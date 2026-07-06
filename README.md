# Kallgren's dotfiles

## Setup

### Clone the repository

You know the drill:

`git clone git@github.com:kallgren/dotfiles.git ~`

### Install applications

1. Install [Homebrew](https://brew.sh/)
2. `cd ~/dotfiles`
3. `brew bundle` (Installs applications listed in [Brewfile](Brewfile))
4. Configure _Flux_ and any others to run at startup

_(Note: this is not a complete list of applications as of 2025-11-25)_

### Symlink configs

I handle configs by symlinking with [`GNU Stow`](https://www.gnu.org/software/stow/) (which you just installed through Homebrew).

> [!NOTE]
> Specify each desired package individually as not all folders in this repo are meant for stowing

```
stow --no-folding zsh tmux vim code karabiner
stow claude
```

### Setup keyboard and hotkeys

#### Karabiner Elements

1. Open up _Karabiner Elements_ (which you just installed through Homebrew)
2. Complex modifications -> "Add prefedined rule", and enable the desired ones

#### MacOS System Settings -> Keyboard Shortcuts

##### -> Keyboard

- "Move focus to next window" -> <kbd>Alt</kbd> + <kbd>Tab</kbd>

##### -> App shortcuts -> All Applications:

I prefer these over Raycast window management due to MacOS's animations and "Previous size" feature

- "Left" -> <kbd>Meh</kbd> + <kbd>H</kbd>
- "Right" -> <kbd>Meh</kbd> + <kbd>L</kbd>
- "Fill" -> <kbd>Meh</kbd> + <kbd>F</kbd>
- "Return to Previous Size" -> <kbd>Meh</kbd> + <kbd>J</kbd>

### Configure applications

#### Raycast

Import my Raycast settings from cloud storage containing hotkeys for apps, clipboard, snippets, etc.

#### VS Code extensions

1. Open up this repository with VS Code and install any relevant recommended extensions

#### Terminal

1. Install [Oh My ZSH!](https://ohmyz.sh/)

### Folder structure

This is my preferred folder structure for my coding projects.

```
~/Code/
├── Courses/       # Course related
├── Hobby/         # Hobby projects
├── Throwaway/     # Temporary tests and experiments
└── Work/          # Work related
```
