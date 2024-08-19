-- Leader g
vim.api.nvim_set_keymap("n", "<Leader>gg", "<cmd>lua require('neogit').open()<CR>", { noremap = true, desc = "Neogit" })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>gs",
  "<cmd>lua require('telescope.builtin').git_status()<CR>",
  { noremap = true, desc = "Git Status Telescope" }
)

vim.api.nvim_set_keymap("n", "<Leader>gh", "<cmd>lua require('gitsigns').preview_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gu", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gU", "<cmd>lua require('gitsigns').reset_buffer()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gq", "<cmd>lua require('gitsigns').setqflist()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gn", "<cmd>lua require('gitsigns').next_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gp", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<Leader>gF",
  "<cmd>DiffviewFileHistory %<CR>",
  { noremap = true, desc = "Diffview current file" }
)
vim.api.nvim_set_keymap("n", "<Leader>gd", "<cmd>DiffviewFileHistory<CR>", { noremap = true, desc = "Diffview" })

vim.api.nvim_set_keymap(
  "n",
  "<leader>gb",
  '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>gb",
  '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  {}
)
vim.api.nvim_set_keymap("n", "<leader>gY", '<cmd>lua require"gitlinker".get_repo_url()<cr>', { silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>gB",
  '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)
