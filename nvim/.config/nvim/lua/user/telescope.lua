-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local lga_actions = require "telescope-live-grep-args.actions"

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        -- ['<C-u>'] = false,
        -- ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-s>"] = lga_actions.quote_prompt { postfix = " -F " },
          ["<C-g>"] = lga_actions.quote_prompt { postfix = ' -g "' },
          ["<C-i>"] = lga_actions.quote_prompt { postfix = " -i " },
          ["<C-t>"] = lga_actions.quote_prompt { postfix = " -t" },
          ["<C-b>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          ["<C-h>"] = lga_actions.quote_prompt { postfix = " --hidden " },
        },
      },
    },
    cmdline = {
      picker = {
        layout_config = {
          width = 120,
          height = 25,
        },
      },
      mappings = {
        complete = "<Tab>",
        run_selection = "<C-CR>",
        run_input = "<CR>",
      },
      output_pane = {
        enabled = true,
      },
    },
  },
}
pcall(require("telescope").load_extension, "cmdline")
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "live_grep_args")
pcall(require("telescope").load_extension, "import")
pcall(require("telescope").load_extension, "git_file_history")
-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end
  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print "Not a git repository. Searching on current working directory"
    return cwd
  end
  return git_root
end
-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require("telescope.builtin").live_grep {
      search_dirs = { git_root },
    }
  end
end
vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- See `:help telescope.builtin`
local function telescope_live_grep_current_buffer()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end
vim.keymap.set("n", "<leader>sb", telescope_live_grep_current_buffer, { desc = "[/] Fuzzily search in current buffer" })

local function telescope_live_grep_open_files()
  require("telescope.builtin").live_grep {
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  }
end
vim.keymap.set("n", "<leader>sB", telescope_live_grep_open_files, { desc = "in [B]uffers" })
vim.keymap.set("n", "<leader>si", require("telescope.builtin").builtin, { desc = "[T]Telescope" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[H]elp" })

vim.keymap.set(
  "n",
  "<leader>sw",
  require("telescope-live-grep-args.shortcuts").grep_word_under_cursor,
  { desc = "current [W]ord" }
)
vim.keymap.set(
  "n",
  "<leader>sf",
  require("telescope").extensions.live_grep_args.live_grep_args,
  { desc = "by Grep Files" }
)
vim.keymap.set("n", "<leader>sg", ":LiveGrepGitRoot<cr>", { desc = "by [G]rep on Git Root" })

vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<leader>so", require("telescope.builtin").resume, { desc = "[O]ld Resume" })
vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[K]eymaps" })

-- P(require("telescope.utils").buffer_dir())
-- lua print(require("telescope.utils").buffer_dir())
-- lua print(vim.fn.fnamemodify(require("telescope.utils").buffer_dir(), 't'))
-- lua print(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h:t'))

vim.keymap.set("n", "<Leader>s.", function()
  local telescope = require "telescope"
  local utils = require "telescope.utils"

  local cwd = utils.buffer_dir()

  if require("user.helpers").string_starts(cwd, "oil://") then
    cwd = string.gsub(cwd, "oil://", "")
  end

  telescope.extensions.live_grep_args.live_grep_args { prompt_title = cwd, search_dirs = { cwd } }
end, { silent = true, noremap = true, desc = "in current directory[.].." })

-- Symfony specific search

require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>sa",
  "Assets",
  "assets",
  { silent = true, noremap = true, desc = "[A]ssets" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>sc",
  "Config",
  "config",
  { silent = true, noremap = true, desc = "[C]onfig" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>ss",
  "Src",
  "src",
  { silent = true, noremap = true, desc = "[S]rc" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>st",
  "Templates",
  "templates",
  { silent = true, noremap = true, desc = "[T]emplates" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>sl",
  "Translations",
  "translations",
  { silent = true, noremap = true, desc = "Trans[L]ations" }
)

require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>sr",
  "Controller",
  "src/Controller",
  { silent = true, noremap = true, desc = "Controlle[R]" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>se",
  "Entity",
  "src/Entity",
  { silent = true, noremap = true, desc = "[E]ntity" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>sn",
  "Enum",
  "src/Enum",
  { silent = true, noremap = true, desc = "E[N]um" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>sm",
  "Form",
  "src/Form",
  { silent = true, noremap = true, desc = "For[M]" }
)
require("user.symfony").define_symfony_grep_keymap(
  "n",
  "<Leader>sv",
  "Service",
  "src/Service",
  { silent = true, noremap = true, desc = "Ser[V]ice" }
)

vim.keymap.set(
  "n",
  "<leader>gf",
  require("telescope").extensions.git_file_history.git_file_history,
  { desc = "[F]ile history" }
)

-- vim.api.nvim_set_keymap('n', '<Leader>sc', "<cmd>Telescope live_grep search_dirs=./app/src/Controller/<CR>", {noremap = true})
