#Neovim Configuration

This repository contains my Neovim configuration, designed for a modern, efficient, and highly customizable development environment. It includes various plugins, LSP configurations, and a custom setup for enhanced coding experience across multiple languages.
Features

    Lazy.nvim for plugin management.
    LSP support for multiple languages including Lua, TypeScript, C++, Python, and Rust.
    Autocomplete with nvim-cmp and luasnip for snippets.
    Debugging using nvim-dap with UI integration.
    Treesitter for syntax highlighting and indentation.
    File navigation with Telescope and Neo-tree.
    Version control with gitsigns and vim-fugitive.
    Beautiful UI with catppuccin colorscheme and lualine statusline.

Installation

    Clone this repository into your Neovim configuration directory:

    bash

git clone https://github.com/Sriram19g/neovim ~/.config/nvim

Ensure you have the following dependencies installed:

    Neovim (>= 0.8)
    Lazy.nvim
    Git
    LSP servers for desired languages (optional: use mason.nvim for automated installation)

Open Neovim and run the following to install all plugins:

vim

:Lazy sync

For LSP servers and DAP setup, mason.nvim will handle automatic installation:

vim

    :Mason

Key Mappings

    <leader>ff: Find files using Telescope
    <leader>fg: Search text using Telescope live_grep
    <leader>0: Open Neo-tree on the left
    <leader>9: Open Neo-tree as a floating window
    K: Show hover documentation for LSP
    gd: Go to definition
    gr: Go to references
    <leader>ca: Code actions
    <leader>gf: Format code with null-ls
    <leader>dt: Toggle DAP breakpoint
    <leader>dc: Continue debugging

Plugins

Here are the key plugins used in this configuration:

    lazy.nvim: Plugin manager
    telescope.nvim: Fuzzy finder and more
    nvim-treesitter: Treesitter-based syntax highlighting
    catppuccin: Theme for Neovim
    nvim-lspconfig: LSP configuration for various languages
    nvim-cmp: Autocompletion plugin
    nvim-dap: Debugging with DAP
    gitsigns.nvim: Git integration
    vim-fugitive: Git wrapper

For a complete list, see lazy_setup.lua.
License

This configuration is available under the MIT License. Feel free to modify and share it!# neovim
