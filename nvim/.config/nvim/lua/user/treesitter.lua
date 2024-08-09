-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
      'bash',
      'c',
      "css",
      "dockerfile",
      "gitignore",
      'go',
      "html",
      'javascript',
      "json",
      "lua",
      'php',
      'python',
      "query",
      'tsx',
      "twig",
      'typescript',
      "vim",
      "vimdoc",
      "yaml",
    },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = {},
    -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
    modules = {},
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-w>',
        node_incremental = '<c-w>',
        node_decremental = '<c-s>',
        scope_incremental = false,
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          -- ["a="] = "@assignment.outer",
          -- ["i="] = "@assignment.inner",
          -- ["l="] = "@assignment.lhs",
          -- ["r="] = "@assignment.rhs",
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@call.outer',
          ['if'] = '@call.inner',
          ['am'] = '@function.outer',
          ['im'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ak'] = '@comment.outer',
          ['ik'] = '@comment.inner',
          ["ir"] = "@block.inner",
          ["ar"] = "@block.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ['sf'] = '@call.outer',
          ['sm'] = '@function.outer',
          ['si'] = '@conditional.outer',
          ['sl'] = '@loop.outer',
          ['sk'] = '@comment.outer',
        },
        goto_next_end = {
          ['sF'] = '@call.outer',
          ['sM'] = '@function.outer',
          ['sI'] = '@conditional.outer',
          ['sL'] = '@loop.outer',
          ['sK'] = '@comment.outer',
        },
        goto_previous_start = {
          ['Sf'] = '@call.outer',
          ['Sm'] = '@function.outer',
          ['Si'] = '@conditional.outer',
          ['Sl'] = '@loop.outer',
          ['Sk'] = '@comment.outer',
        },
        goto_previous_end = {
          ['SF'] = '@call.outer',
          ['SM'] = '@function.outer',
          ['SI'] = '@conditional.outer',
          ['SL'] = '@loop.outer',
          ['SK'] = '@comment.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>ra'] = '@parameter.inner',
          ['<leader>rm'] = '@function.inner',
          ['<leader>rp'] = '@property.inner',
        },
        swap_previous = {
          ['<leader>rA'] = '@parameter.inner',
          ['<leader>rM'] = '@function.inner',
          ['<leader>rP'] = '@property.inner',
        },
      },
    },
  }
end, 0)

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_opposite)
