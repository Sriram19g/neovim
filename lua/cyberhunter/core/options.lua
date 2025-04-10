vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.tabstop = 4 -- space for tab
opt.shiftwidth = 4  -- space for indent width
opt.expandtab = true -- expand tab to space
opt.autoindent =  true -- copy indent from current line when starting new one

opt.wrap = false

--search settings
opt.ignorecase = true --ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assume you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

--backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

--clipboard
opt.clipboard:append("unnamedplus") --use system clipboard as default register

--split windows
opt.splitright = true --split vertical window to the right
opt.splitbelow = true --split horzontal window to the bottom 
