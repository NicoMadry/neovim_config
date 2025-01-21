This doc summarizes how to install and use this configuration in detail.

# Pre-requisite

## Terminal emulators

Which [terminal emulator](https://en.wikipedia.org/wiki/Terminal_emulator) we choose to use greatly affects the appearance and features of Nvim.
Since Nvim supports true colors, terminals that support true colors are preferred.
For a list of terminals that support true colors, see [here](https://github.com/termstandard/colors).

For macOS, we can use [kitty](https://sw.kovidgoyal.net/kitty/), [iterm2](https://www.iterm2.com/), [wezterm](https://wezfurlong.org/wezterm/) or [Alacritty](https://github.com/jwilm/alacritty).

For the latest version of Windows 10 or 11, you can also try [Windows Terminal](https://github.com/microsoft/terminal).

## Patched Fonts

Since statusline or file explorer plugins often use Unicode symbols not available in normal font,
we need to install a patched font from the [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) project.

# Automatic installation


## Automatic installation for MacOS


# Manual install

There are a few dependencies if we want to use Nvim for efficient editing and development work.

## Dependencies

### Python

A lot of Nvim plugins are mainly written in Python, so we must install Python 3.
The easiest way to install is via [Anaconda](https://docs.anaconda.com/anaconda/install/index.html) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html).

After installation, make sure that you can run `python --version`,
and that the output should be Python 3.x.

### Pynvim

Nvim relies on [pynvim](https://github.com/neovim/pynvim) to communicate with plugins that utilize its Python binding.
Pynvim is required by plugins such as [wilder.nvim](https://github.com/gelguy/wilder.nvim).

```
pip install -U pynvim
```

### python-lsp-server

[python-lsp-server (pylsp)](https://github.com/python-lsp/python-lsp-server) is a Python [Language Server](https://microsoft.github.io/language-server-protocol/) for completion, linting, go to definition, etc.

```
pip install 'python-lsp-server[all]' pylsp-mypy python-lsp-isort python-lsp-black
```

Note the executable for pylsp is also named `pylsp`. You need to set its PATH correctly.
If you use pip from Anaconda, the executable path may be something like `$CONDA_ROOT/bin/pylsp`.
For native python, the path for pylsp may be like `$HOME/.local/bin/pylsp`

### Node

We need to install node.js from [here](https://nodejs.org/en/download/).
For MacOS, you can use the following script:

```bash
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.13.0".
nvm current # Should print "v22.13.0".

# Verify npm version:
npm -v # Should print "10.9.2".

```

This will install [NVM](https://github.com/nvm-sh/nvm), a node manager to easily install and switch between multiple node versions 
and then install Node 22.X.

### vim-language-server

[vim-language-server](https://github.com/iamcco/vim-language-server) provides completion for vim script. We can install vim-language-server globally:

```bash
  npm install -g vim-language-server
```

vim-language-server is installed in the same directory as the node executable.

### bash-language-server

```bash
  npm i -g bash-language-server
```

### Git

Git is required by plugin manager [lazy.nvim](https://github.com/folke/lazy.nvim) and other git-related plugins.

For Linux and macOS, Git is usually pre-installed.
Ensure a relatively up-to-date version is installed.

To install it use:
```bash
  brew install git
```

to update it use:
```bash
  brew upgrade git
```

### Ripgrep

[Ripgrep](https://github.com/BurntSushi/ripgrep), aka, `rg`, is a fast grepping tool available for both Linux, Windows and macOS.
It is used by several searching plugins.

For macOS we can install it via brew:
```bash
  brew install ripgrep
```

Set its PATH properly and make sure you can run `rg` from command line.

### Linters

A linter is a tool to check the source code for possible style and syntax issues.
Based on the programming languages we use, we may need to install various linters.

+ Python: [pylint](https://github.com/PyCQA/pylint) and [flake8](https://github.com/PyCQA/flake8).
+ Vim script: [vint](https://github.com/Kuniwak/vint).

Set their PATH properly and make sure you can run `pylint`, `flake8` and `vint` from command line.

## Install Nvim

There are various ways to install Nvim depending on your system.
This config is only maintained for [the latest nvim stable release](https://github.com/neovim/neovim/releases/tag/stable).

Please check the official doc on how to install Neovim on different systems: https://github.com/neovim/neovim/blob/master/INSTALL.md

After installing Nvim, we need to set the PATH to nvim correctly.
**Make sure that you can run `nvim` from the command line after all these setups**.

## Setting up Nvim

After installing nvim and all the dependencies, we will install plugin managers and set up this config.

### How to install this configuration

On Linux and macOS, the directory is `~/.config/nvim`.
First, we need to remove all the files under the config directory (including dot files),
then go to this directory, and run the following command:

```
git clone --depth=1 https://github.com/NicoMadry/neovim-config.git .
```

After that, when we first open nvim, all the plugins will be installed automatically.
Since I use quite a lot of plugins (more than 60), it may take some time to install all of them.
