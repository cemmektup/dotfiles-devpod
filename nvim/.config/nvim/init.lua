vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.g.snippets = "luasnip"

require "user.plugins"
require "user.utils"
require "user.helpers"
require "user.table"

require("mini.ai").setup()
require "user.globals"
require "user.augroup"
require "user.telescope"
require "user.key_mappings"
require "user.treesitter"
require "user.which_key"
require "user.lsp"
require "user.cmp"

require("neogit").setup {}
require "user.neotest"
require "user.oil"

-- require "user.disable_builtin"
-- require "user.plugins_setup"

require "user.snips"
require "user.format_file"

require "user.overseer"
require "user.todo"
require "user.origami"

-- require "user.noice"
require "user.dressing"
require "user.chatgpt"
require "user.parrot"
-- require'user.repl'
-- require'user.nvim-repl'
require "user.macros"
require "user.git"

require("package-info").setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
