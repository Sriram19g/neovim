--General Mappings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

-- Set mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load lazy.nvim setup
require("lazy_setup")

-- Key mappings
local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	telescope_builtin.find_files()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", function()
	telescope_builtin.live_grep()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>0", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>9", ":Neotree filesystem reveal float<CR>", {})

-- Setup nvim-treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

-- Set up Catppuccin colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")

--Set up lualine
require("lualine").setup({
	options = { theme = "dracula" },
})

--Set up Mason
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "lua_ls", "clangd", "pyright", "asm_lsp", "rust_analyzer" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    capabilities = capabilities,
})
lspconfig.ts_ls.setup({
	capabilities = capabilities,
})
lspconfig.clangd.setup({
	capabilities = capabilities,
})
lspconfig.pyright.setup({
	capabilities = capabilities,
})
lspconfig.asm_lsp.setup({
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

--Set up ui-select
-- This is your opts table
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})
require("telescope").load_extension("ui-select")

--Set up none-ls

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
	},
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

--Set up alpha-nvim -- dashboard

local alpha = require("alpha")
local dashboard = require("alpha.themes.startify")

dashboard.section.header.val = {
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
}

alpha.setup(dashboard.opts)

--setting up nvim-cmp for autocompletion

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

--Setup nvim-dap

local dap = require("dap")
vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})
local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

--setup auto-pairs
require("nvim-autopairs").setup({ disable_filetype = { "telescopeprompt", "vim" } })

--setup gits signs
require("gitsigns").setup()
vim.keymap.set('n','<Leader>gp',":Gitsigns preview_hunk<CR>",{})
vim.keymap.set('n','<Leader>gt',":Gitsigns toggle_current_line_blame<CR>",{})
