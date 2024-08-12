local set = vim.keymap.set
set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true, silent = true })
set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true, silent = true })
set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true })
set("n", "<c-ö>", "<cmd>TmuxNavigatePrevious<cr>", { noremap = true, silent = true })
