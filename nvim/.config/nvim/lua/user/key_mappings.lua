-- [[ Basic Keymaps ]]
local set = vim.keymap.set

-- Keymaps for better default experience
-- See `:help set()`
set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true })

-- Down is really the next line
-- vim.api.nvim_set_keymap('n', 'j', 'gjzz', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'k', 'gkzz', { noremap = true })
vim.api.nvim_set_keymap("n", "j", "jzz", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "kzz", { noremap = true })

-- Easy escaping to normal mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

-- Better tabbing
vim.api.nvim_set_keymap("n", "<TAB>", ">>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", "<<", { noremap = true })
vim.api.nvim_set_keymap("v", "<TAB>", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-TAB>", "<gv", { noremap = true })

-- Move line(s) up and down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Search n and N
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- paste without change the register
set("x", "<leader><leader>p", [["_dP]], { noremap = true, desc = "Paste without change the register" })
set({ "n", "v" }, "<leader><leader>d", [["_d]], { noremap = true, desc = "Delete without change the register" })

-- Move line(s) up and down
vim.api.nvim_set_keymap("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-k>", ":m '>-2<CR>gv=gv", { noremap = true })

-- Terminal Mode
vim.api.nvim_set_keymap("t", "<C-c><C-c>", "<C-\\><C-n>", { noremap = true })
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- vim.api.nvim_set_keymap('t', '<leader><leader>k', '<C-\\><C-n>', { noremap = true })

-- Buffers
vim.api.nvim_set_keymap("n", "<C-M-h>", "<cmd>bprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-M-l>", "<cmd>bnext<CR>", { noremap = true })

-- Quickfix
vim.api.nvim_set_keymap("n", "<C-M-j>", ":cn<CR>zz", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-M-k>", ":cp<CR>zz", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-M-o>", ":copen<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-M-i>", ":cclose<CR>", { silent = true, noremap = true })

-- ---------------
-- Leaders
-- ---------------
-- set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vim.api.nvim_set_keymap("n", "<Leader>u", ":up<CR>", { silent = true, noremap = true, desc = "File save[.].." })

-- Leader <CR>
-- switch hlsearch
vim.api.nvim_set_keymap("n", "<Leader><CR>", ":let v:hlsearch=!v:hlsearch<CR>", { noremap = true })

-- Leader tab
-- Down is really the next line
vim.api.nvim_set_keymap("n", "<Leader><TAB>", "<C-^>", { noremap = true })

-- Leader q
-- Close ALL
vim.api.nvim_set_keymap("n", "<Leader>qq", ":wqall!<CR>", { noremap = true })

-- Leader w
-- Better window controll
-- vim.api.nvim_set_keymap("n", "<Leader>ww", "<C-w>w", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>wr", "<C-w>r", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ww", "<C-w>q", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>wo", ":only<CR>", { noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<Leader>wk",
  ":vsplit<CR>:lua require('telescope.builtin').lsp_definitions()<CR>",
  { silent = true, noremap = true }
)

-- Zoom Out
vim.api.nvim_set_keymap("n", "<Leader>we", "<C-w>=", { noremap = true })
-- vim-maximizer
vim.api.nvim_set_keymap("n", "<Leader>wm", ":MaximizerToggle<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>wm", ":MaximierToggle<CR>gv", { silent = true, noremap = true })
-- Open splits
vim.api.nvim_set_keymap("n", "<Leader>wn", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>wv", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ws", ":split<CR>", { noremap = true })
-- Open splits
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", { silent = true, noremap = true })

-- Leader b
vim.api.nvim_set_keymap("n", "<leader>bq", "<cmd>bw<CR>", { silent = true, noremap = true, desc = "[Q]uit buffer" })

-- Leader a
-- Action
-- vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>Telescope cmdline<CR>', { noremap = true, desc = 'Search cmd' })
vim.api.nvim_set_keymap("n", "<leader>aa", ":", { noremap = true, desc = "open [A]ction" })
vim.api.nvim_set_keymap("v", "<leader>aa", ":", { noremap = true, desc = "open [A]ction" })
vim.api.nvim_set_keymap("n", "<Leader>ar", ":e! %<CR>", { silent = true, noremap = true, desc = "action [R]evert" })
vim.api.nvim_set_keymap("n", "<Leader>ad", ":e .<CR>", { silent = true, noremap = true, desc = "open [D]irectory" })
vim.api.nvim_set_keymap("n", "<Leader>a.", ":e %:h<CR>", { silent = true, noremap = true, desc = "open [D]irectory" })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ak",
  ":vsp ~/.config/nvim/lua/user/key_mappings.lua<CR>",
  { silent = true, noremap = true, desc = "open [K]ey maps" }
)

-- Leader f
-- Find with Telescope
-- vim.api.nvim_set_keymap('n', '<Leader>fq', ':up<CR>:q!<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>fp', ':vsp ~/.config/nvim/init.lua<CR>', { noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<Leader>fq",
  "<cmd>lua require('telescope.builtin').quickfix()<CR>",
  { silent = true, noremap = true, desc = "[Q]uickfix" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  "<cmd>lua require('telescope.builtin').find_files()<CR>",
  { silent = true, noremap = true, desc = "[F]ind [F]iles" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  ":Telescope buffers<CR>",
  { silent = true, noremap = true, desc = "[B]uffers" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fg",
  "<cmd>lua require('telescope.builtin').git_files()<CR>",
  { silent = true, noremap = true, desc = "[G]it [F]iles" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fo",
  ":Telescope oldfiles<CR>",
  { silent = true, noremap = true, desc = "[O]ld [F]iles" }
)

set("n", "<Leader>f.", function()
  local builtin = require "telescope.builtin"
  local utils = require "telescope.utils"
  local cwd = utils.buffer_dir()

  if require("user.helpers").string_starts(cwd, "oil://") then
    cwd = string.gsub(cwd, "oil://", "")
  end

  builtin.find_files { cwd = cwd, prompt_title = cwd }
end, { silent = true, noremap = true, desc = "in current directory[.].." })

-- TODO: Telescope
-- set("n", "<leader>fu", function()
--   local bufnrs = {}

--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_get_name(buf) ~= "" then
--       table.insert(bufnrs, buf)
--     end
--   end

--   -- for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--   --   if false == vim.api.nvim_get_option_value('modified', { buf = buf }) and vim.api.nvim_buf_is_loaded(buf) then
--   --     table.insert(bufnrs, buf)
--   --   end
--   -- end

--   if vim.tbl_isempty(bufnrs) then
--     vim.print("No modified buffers")
--   else
--     P(bufnrs)
--     -- vim.cmd("lua require('telescope.builtin').buffers()")
--     -- require("telescope.builtin").buffers { bufnrs = { 175 } }
--   end
-- end, { silent = true, desc = "Find [U]nmodified buffers" })

-- Symfony specific search
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fa",
  "Assets",
  "assets",
  { silent = true, noremap = true, desc = "Assets" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fc",
  "Config",
  "config",
  { silent = true, noremap = true, desc = "Config" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fs",
  "Src",
  "src",
  { silent = true, noremap = true, desc = "Src" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>ft",
  "Templates",
  "templates",
  { silent = true, noremap = true, desc = "Templates" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fl",
  "Translations",
  "translations",
  { silent = true, noremap = true, desc = "Translations" }
)

require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fr",
  "Controller",
  "src/Controller",
  { silent = true, noremap = true, desc = "Controller" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fe",
  "Entity",
  "src/Entity",
  { silent = true, noremap = true, desc = "Entity" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fn",
  "Enum",
  "src/Enum",
  { silent = true, noremap = true, desc = "Enum" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fm",
  "Form",
  "src/Form",
  { silent = true, noremap = true, desc = "Form" }
)
require("user.symfony").define_symfony_find_file_keymap(
  "n",
  "<Leader>fv",
  "Service",
  "src/Service",
  { silent = true, noremap = true, desc = "Service" }
)

-- Leader l
-- LSP Document
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ll",
  ":Telescope lsp_document_symbols<CR>",
  { silent = true, noremap = true, desc = "Document [S]ymbols" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lL",
  ":Telescope lsp_dynamic_workspace_symbols<CR>",
  { silent = true, noremap = true, desc = "Workspace [S]ymbols" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lm",
  "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols='method' })<CR>",
  { silent = true, noremap = true, desc = "Document [M]ethods" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lp",
  "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols='property' })<CR>",
  { silent = true, noremap = true, desc = "Document [P]roperties" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lf",
  "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols='function' })<CR>",
  { silent = true, noremap = true, desc = "Document [F]unctions" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lc",
  "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols='class' })<CR>",
  { silent = true, noremap = true, desc = "Document [C]lasses" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ld",
  "<cmd>lua require('telescope.builtin').lsp_type_definitions<CR>",
  { silent = true, noremap = true, desc = "Document [D]efinitions" }
)

-- Diagnostic keymaps
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Leader r
-- Refactoring
vim.api.nvim_set_keymap(
  "n",
  "<Leader>rr",
  "<cmd>lua require('refactoring').select_refactor()<CR>",
  { noremap = true, desc = "Refactor" }
)
vim.api.nvim_set_keymap(
  "x",
  "<Leader>rr",
  "<cmd>lua require('refactoring').select_refactor()<CR>",
  { noremap = true, desc = "Refactor" }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>re",
  "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
  { noremap = true, desc = "Extract Function" }
)
vim.api.nvim_set_keymap(
  "x",
  "<Leader>re",
  "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
  { noremap = true, desc = "Extract Function" }
)
-- vim.api.nvim_set_keymap("x", '<Leader>rf', "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
--   { noremap = true, desc = 'Extract Function to File' })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>rv",
  "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
  { noremap = true, desc = "Extract Variable" }
)
vim.api.nvim_set_keymap(
  "x",
  "<Leader>rv",
  "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
  { noremap = true, desc = "Extract Variable" }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ri",
  "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
  { noremap = true, desc = "Inline Variable" }
)
vim.api.nvim_set_keymap(
  "x",
  "<Leader>ri",
  "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
  { noremap = true, desc = "Inline Variable" }
)
vim.api.nvim_set_keymap(
  "x",
  "<Leader>rI",
  "<cmd>lua require('refactoring').refactor('Inline Function')<CR>",
  { noremap = true, desc = "Inline Function" }
)

vim.api.nvim_set_keymap(
  "x",
  "<Leader>rb",
  "<cmd>lua require('refactoring').refactor('Extract Block')<CR>",
  { noremap = true, desc = "Extract Block" }
)
vim.api.nvim_set_keymap(
  "x",
  "<Leader>rB",
  "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
  { noremap = true, desc = "Extract Block to File" }
)

-- Leader t
-- Terminal floaterm
vim.api.nvim_set_keymap("n", "<leader>tt", "<CMD>FloatermToggle<CR>", { noremap = true, desc = "[T]erminal [T]oggle" })
vim.api.nvim_set_keymap("t", "tt", "<CMD>FloatermToggle<CR>", { noremap = true, desc = "[T]erminal [T]oggle" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>ts",
  "<CMD>FloatermNew --wintype=split<CR>",
  { noremap = true, desc = "[T]erminal New [S]plit" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>tv",
  "<CMD>FloatermNew --wintype=vsplit<CR>",
  { noremap = true, desc = "[T]erminal New [V]split" }
)
vim.api.nvim_set_keymap("n", "<leader>tf", "<CMD>FloatermNew<CR>", { noremap = true, desc = "[T]erminal [N]ew" })
vim.api.nvim_set_keymap("n", "<leader>tn", "<CMD>FloatermNext<CR>", { noremap = true, desc = "[T]erminal [N]ext" })
vim.api.nvim_set_keymap("n", "<leader>tp", "<CMD>FloatermPrev<CR>", { noremap = true, desc = "[T]erminal [P]rev" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>t.",
  "<CMD>FloatermNew! cd %:h<CR>",
  { noremap = true, desc = "[T]erminal di[R]ectory" }
)

-- Leader y
-- Yank
local yank_expand = function(expand_val)
  local expand = vim.fn.expand(expand_val)
  print("Yank: ", expand)
  vim.cmd('let @+ = expand("' .. expand_val .. '")')
end
set("n", "<leader>yn", function()
  yank_expand "%:t:r"
end, { silent = true, noremap = true, desc = "[Y]ank [N]ame" })
set("n", "<leader>yr", function()
  yank_expand "%"
end, { silent = true, noremap = true, desc = "[Y]ank [R]elative file" })
set("n", "<leader>ya", function()
  yank_expand "%:p"
end, { silent = true, noremap = true, desc = "[Y]ank [A]absolute file" })
set("n", "<leader>yt", function()
  yank_expand "%:t"
end, { silent = true, noremap = true, desc = "[Y]ank file with [T]ype" })
set("n", "<leader>yd", function()
  yank_expand "%:p:h"
end, { silent = true, noremap = true, desc = "[Y]ank [D]irectory" })
set("n", "<leader>yp", ":norm yygccp<CR>", { silent = true, noremap = true, desc = "[Y]ank and [P]aste" })

set(
  "n",
  "<leader>yl",
  ":Telescope neoclip unnamed extra=star,plus<CR>",
  { silent = true, noremap = true, desc = "[Y]ank [L]ist" }
)
