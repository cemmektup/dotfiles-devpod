vim.o.textwidth = 120                 -- Change the number of maximun width of text that is being inserted
vim.o.shiftwidth = 2                  -- Change the number of space characters inserted for indentation
vim.opt.expandtab = true
vim.opt.formatoptions:remove({ 'o' }) -- Stop newline continution of comments
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>fx', ':luafile %<CR>',
  { silent = true, noremap = true, desc = "Execute the current file" })
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>x', ':source %<CR>',
  { silent = true, noremap = true, desc = "Source the current file" })
