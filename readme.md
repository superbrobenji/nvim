# Welcome to my neovim setup.

This setup is based on the setup from [The PrimeAgen](https://www.youtube.com/watch?v=w7i4amO_zaE)

## Installation

### prerequisites
- You need [neovim](https://neovim.io/) installed
- You need Grep installed
- You need tmux installed and configured (Steps in TODO)

### installation steps
- Clone this repo inside your config path, you can find the path by opening Neovim and type `:h rtp`
- Once cloned rename the `benjamin` folder to your preferred name and update the import in the root `init.lua` 
- Navigate to `lua/<your name>` and open `packer.lua` in neovim. Don't worry about the errors.
- run `:so`
- Run `:packerSync` to install all the packer files.
- Restart Neovim.
- run `:Copilot auth` and follow the prompts
- restart Neovim again


## Available commands
- `:lua ColorMyPencils()` This resets the styling of Neovim after PackerSync is run.
- `:Mason` This opens the LSP package manager where you can find and install any LSP config or linter you want
- `:LspInstall` finds and installs any relevant Lsp packages or linters for you file you're on.

## Things to note
- The general keymaps are under `/lua/<your name>/remap.lua`. Feel free to change them to your preference
- The keymaps for each plugin are under their respective config file in `/after/plugin`.
- The general settings for Neovim is under `/lua/<your name>/set.lua`
- If you are using Windows. Go to the general settings file and change the undodir according to the comment

## Adding new packages
When you want to add a new package, add it to `/lua/<your name>/packer.lua` as the others are. Then create a new config file for in under `/after/plugin` as a `.lua` file.

## Current quirks
There is one keymap that uses tmux that currently needs [tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer) and [tmux-windownizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-windowizer)
