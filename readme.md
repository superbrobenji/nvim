# Welcome to my neovim setup.

This setup is based on the setup from [The PrimeAgen](https://www.youtube.com/watch?v=w7i4amO_zaE)

## Installation

### Prerequisites
- You need [neovim](https://neovim.io/) installed.
- You need Grep and ripgrep installed.
- If you want to use Copilot, you'll need a Copilot subscription.

### Installation steps
- Clone this repo inside your config path, you can find the path by opening Neovim and type `:h rtp`.
- Once cloned rename the `benjamin` folder to your preferred name and update the import in the root `init.lua` .
- Navigate to `lua/<your name>` and open `packer.lua` in neovim. Don't worry about the errors.
- run in your shell `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim`.
- Run `:so`
- Run `:PackerSync` to install all the packer files.
- Restart Neovim.
- Run `:Mason` and install `Prettierd`, `Prettier`, `Eslint_d`, `netcoredbg` and `marksman` by pressing `i` over it.
- Run `:Copilot auth` and follow the prompts.
- Restart Neovim again

### Installing tmux and fzf
#### Installing tmux
- Run `sudo apt-get install tmux` for ubuntu or `brew install tmux` for mac users.
- copy the contents of `tmux-setup` into your home directory.
#### Installing fzf
- Clone `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`.
- Run `~/.fzf/install`.

## Available commands
- `:lua ColorMyPencils()` This resets the styling of Neovim after PackerSync is run.
- `:Mason` This opens the LSP package manager where you can find and install any LSP config or linter you want.
- `:LspInstall` finds and installs any relevant Lsp packages or linters for you file you're on.
- `:TSUpdate` will update Treesitter.

## Things to note
- Ron't forget to run tmux before opening nvim if you want to be able to jump between projects quickly and easily.
- The general keymaps are under `/lua/<your name>/remap.lua`. Feel free to change them to your preference.
- The keymaps for each plugin are under their respective config file in `/after/plugin`.
- The general settings for Neovim is under `/lua/<your name>/set.lua`
- If you are using Windows. Go to the general settings file and change the undodir according to the comment.

## Adding new packages
When you want to add a new package, add it to `/lua/<your name>/packer.lua` as the others are. Then create a new config file for in under `/after/plugin` as a `.lua` file.

## Current quirks
There is one keymap that uses tmux that currently needs [tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer) and [tmux-windownizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-windowizer)

## TODOs
- Add Node debugger for chrome and node in dap
- test csharp dap debugger
- add the font installations steps for the nvimWebDevIcons plugin on linux
- test nvim setup on windows and document installation steps
- fresh install tests on linux and mac and update installation steps accordingly
- fix grammarly plugin on linux
- fix marksman plugin on linux
- debug lsp-lense to work more reliably
- possinbly write plugin to integrate nuget gallery to nvim
