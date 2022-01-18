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

