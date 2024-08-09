local set = vim.keymap.set

-- Better Macros
set("n", 'Q', '@qj', { noremap = true })
set("x", 'Q', ':norm @q<CR>', { noremap = true })

local goto_class = function()
  require('macroni').run('/^class<Enter>wzz')
end

set('n', '<Leader>qgc', goto_class, { silent = true, remap = true, desc = 'goto [C]lass' })
