-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  -- 'tpope/vim-commentary',         -- For commenting gcc & gc
  "tpope/vim-surround", -- Surround text objects easily
  "tpope/vim-repeat", -- Repeat actions better
  "rhysd/clever-f.vim",
  -- 'justinmk/vim-sneak',           -- Check if you need this
  "terryma/vim-multiple-cursors", -- CTRL + N for multiple cursors
  -- 'jiangmiao/auto-pairs',
  "christoomey/vim-tmux-navigator",
  "windwp/nvim-ts-autotag",
  "brenoprata10/nvim-highlight-colors",
  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim", opts = {} },
  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },
  "jesseleite/nvim-macroni",

  { import = "custom.plugins" },
}, {})
