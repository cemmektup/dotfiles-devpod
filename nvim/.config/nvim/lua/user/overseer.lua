-- A task runner and job management plugin for Neovim
require("overseer").setup()

-- Leader e
-- Execute Job Runner
vim.api.nvim_set_keymap("n", "<Leader>er", ":OverseerRun<CR>", { silent = true, noremap = true, desc = "open Runner" })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ee",
  ":OverseerToggle<CR>",
  { silent = true, noremap = true, desc = "toggle [L]ist Runner" }
)

vim.keymap.set("n", "<Leader>em", function()
  local phpstan = [[make\ phpstan-raw\ \\\|\ grep\ \"src/\\\\\|tests/\"]]
  vim.cmd("set makeprg=" .. phpstan)
  vim.cmd "make"
end, { silent = true, noremap = true, desc = "[E]xecute [M]ake phpstan" })
