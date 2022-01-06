# Neovide

## Introduction

This is my ongoing attempt to create a fully-fledged IDE entirely from neovim using lua and various plugins.

For the most part, this will just be an orchestration of different plugins to achieve the desired capabilities.
The custom code will mostly be configuration of the different plugins. If more robust implementations are needed,
They should be broken out into separate libraries altogether (though I am trying to avoid that and the need to
maintain a real plugin).

I will try to keep this documentation up to date as much as possible, I'm a dumbass and will absolutely forget
what I've done in the past and end up repeating the same mistakes. Hopefully it'll help anyone else that _happens_
to come across this project (this _is_ only included in my dotfiles repo for now, I should really break it out into
it's own).

## Current functionality

#### Package Manager

[`packer.nvim`](https://github.com/wbthomason/packer.nvim) Is the current lua-standard package manager that I'll
be using until something quantifiably better comes along.

#### LSP

##### Currently supported language servers

These may or may not be complete, or they are using other packages as a crutch while I figure out
what needs to happen to make that functionality work natively.

- Typescript / Javascript
- Lua (barely)

### Packages / Features

See `lua/plugins.lua` for a detailed list of current features. This is just a quick list of what's available.

- Autocompletion (with snippets)
- Surround current selection
- Async command execution `:Dispatch`
- Easy commenting
- Multiple cursors
- Fuzzy finder
- Auto pairs (automatically close brackets)
- Hotkey helper
- Fancy statusline
- Fancy tab bar
- Treesitter for better syntaxt highlighting
- Minimap (currently disabled due to some bugs)
- Diagnostics view
- Linting
    - Typescript
    - Bash
    - JSON
- Markdown previewer
- Git highlighting on the line number
- Live Git blame (virtual text)
- Git diff viewer
- Tabnine AI autocomplete

## History

#### Startup Time

Due to this project basically just being configured dependencies, performance is a very real concern.

- lazy loading as many plugins as possible has helped speed things up
    - This has also lead to a new and better organization for the folder structure
- removing plugins that have long startup times and aren't really necessary or useful
    - vim-ultest was nice, but needed a lot more configuration to work well. No real use for it when I can just open a split window.

#### Native LSP Linting

I was able to switch from ALE to using the builtin LSP to keep things native. I ended up using a
combination of suggested plugins.

    - [`nvim-lsp-ts-utils`](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils)
    - [`null-ls`](https://github.com/jose-elias-alvarez/null-ls.nvim)
        - [blog post](https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c)
    - [`efm-langserver`](https://github.com/mattn/efm-langserver)
        - [blog post](https://phelipetls.github.io/posts/configuring-eslint-to-work-with-neovim-lsp)

In a future version of neovim, this may not be required. This seems more native, but still isn't part of the core

    - [`eslint language server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint)
        - This one seems the most native, but first attempt didn't work.

#### Tree file explorers

I started out using Fern, but that took too much configuration. `nvim-tree` had more sane defaults
and worked a lot easier out of the box.

#### Status line

galaxyline was easy to implement, but ended up breaking visual-block mode. Updated to use
`lualine` which has turned out to be easier and less buggy. Might end up trying out other
packages like `cokeline`, but I'm happy with this for now.

## Notes

- Plugins and their configs are in individual folders with either/both of `config.lua` and `keymap.lua`.
The purpose of this is for lazy loading and error handling. In order for the config of each plugin to not
throw an error if the plugin isn't installed, it must be `require`d as a callback of the `config` key passed
to the `use` function. The keymap cannot be part of the config for plugins that load on command execution 
or else the keymapping will not be available.
