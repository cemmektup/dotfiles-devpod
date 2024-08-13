-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes:2"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
require("nvim-highlight-colors").setup {}

local opt = vim.opt

opt.cursorline = true -- Enable highlighting of the current line
-- path settings
opt.path:append { "**" }
-- Nice menu when typing `:find *.py`
opt.wildmode = "longest,list,full"
opt.wildignore:append { "__pycache__", "*.pyc", "*pycache*", "*_build/*", "**/node_modules/*", "**/.git/*" }

opt.swapfile = false -- disable creating swap file
opt.backup = false

-- opt.relativenumber = true
opt.relativenumber = false
vim.g.snippets = "luasnip"

vim.g.python3_host_prog = "/usr/bin/python"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "3"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 3

vim.g.maximizer_set_default_mapping = O

vim.opt.spelllang = "en_us,de"
-- vim.opt.spell = true

vim.cmd "syntax enable" -- Enables syntax highlighing
