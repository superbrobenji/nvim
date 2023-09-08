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
- Navigate to `lua/<your name>` and open `packer.lua` in neovim
- Run `:packerSync` to install all the packer files.
- then type `:lua ColorMyPencils()` to apply the visual changes.
- Restart Neovim.

## Current quirks
There is one keymap that uses tmux that currently needs [tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer) and [tmux-windownizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-windowizer)
