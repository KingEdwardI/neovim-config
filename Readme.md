# Neovenom

### Name Ideas

Neovide is taken by another nvim ui :/

Neovenom is pretty dumb imo, but it works for now.

## Introduction

This is my ongoing attempt to create a fully-fledged IDE in neovim using lua and various plugins.

For the most part, this will just be an orchestration of different plugins to achieve the desired capabilities.
The custom code will mostly be configuration of the different plugins. If more robust implementations are needed,
They should be broken out into separate libraries altogether (though I am trying to avoid that and the need to
maintain a real plugin).

## Installation / Setup / Requirements

These are instructions on how to install everything you need to use this, and I do mean _everything_. I'm documenting
this from a fresh Linux Mint installation. I'll include generic links for installing stuff as possible.

Might turn it into a shell script if possible...

1. Install git
  - https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
2. Install neovim
  - https://github.com/neovim/neovim/wiki/Installing-Neovim
3. Clone this repo
  - `git clone https://github.com/KingEdwardI/Neovenom`


- Install node/npm
- globally install required libs
  - `npm i -g typescript-language-server eslint_d `

#### Package Manager

[`packer.nvim`](https://github.com/wbthomason/packer.nvim) Is the current lua-standard package manager that I'll
be using until something quantifiably better comes along.

### Notes

- Keymappings for plugins need to be loaded separately from the configurations. Lazy loaded plugins that are loaded
  on command (as opposed to filetype, etc.) need those mappings available.
  - There may be a better way to do this...
- Configs are loaded as part of the `use` method so that if a plugin is not available, errors aren't thrown, and so
  that configurations for lazy loaded plugins are not loaded until necessary.

