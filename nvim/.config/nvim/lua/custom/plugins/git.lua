return {
  { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
  "rhysd/git-messenger.vim",
  { 'ruifm/gitlinker.nvim',   requires = 'nvim-lua/plenary.nvim' },
  "rhysd/committia.vim",    -- Sweet commit messages
  "sindrets/diffview.nvim", -- Sweet diff helper

  "Rawnly/gist.nvim",       -- Gist helper,
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- normal mode
        map('n', '<leader>ga', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line [A]uthor' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })
        -- Toggles
        map('n', '<leader>ta', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })
        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  },
}
