-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Add your plugins here
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"williamboman/mason.nvim",
		},
		{
			"williamboman/mason-lspconfig.nvim",
		},
		{
			"neovim/nvim-lspconfig",
		},
		{
			"nvim-telescope/telescope-ui-select.nvim",
		},
		{
			"nvimtools/none-ls.nvim",
		},
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"nvimtools/none-ls-extras.nvim",
			},
		},
		{
			"goolord/alpha-nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},
		{
			"hrsh7th/cmp-nvim-lsp",
		},
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		},
		{
			"hrsh7th/nvim-cmp",
		},
		{
			"mfussenegger/nvim-dap",
			dependencies = {
				"rcarriga/nvim-dap-ui",
				"nvim-neotest/nvim-nio",
			},
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				"williamboman/mason.nvim",
				"mfussenegger/nvim-dap",
			},
		},
        {
            "lewis6991/gitsigns.nvim"
        },
        {
            "tpope/vim-fugitive"
        },
	},
	install = { colorscheme = { "catppuccin" } }, -- Updated to match the installed colorscheme
	checker = { enabled = true },
})
