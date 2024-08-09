return {
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    submodules = false, -- not needed, submodules are required only for tests
    config = function()
      require("gx").setup {
        open_browser_app = "xdg-open",
        open_browser_args = {},
        handlers = {
          plugin = true,       -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true,       -- open github issues
          gitlab = true,       -- open gitlab issues
          package_json = true, -- open dependencies from package.json
          search = true,       -- search the web/selection on the web if nothing else is found
          jira = {             -- custom handler to open Jira tickets (these have higher precedence than builtin handlers)
            name = "jira",     -- set name of handler
            handle = function(mode, line, _)
              local ticket = require("gx.helper").find(line, mode, "(%u+-%d+)")
              if ticket and #ticket < 20 then
                return "https://slis.atlassian.net/browse/" .. ticket
              end
            end,
          },
        },
        handler_options = {
          search_engine = "google",               -- you can select between google, bing, duckduckgo, and ecosia
          select_for_search = false,              -- if your cursor is e.g. on a link, the pattern for the link AND for the word will always match. This disables this behaviour for default so that the link is opened without the select option for the word AND link

          git_remotes = { "upstream", "origin" }, -- list of git remotes to search for git issue linking, in priority
          -- git_remotes = function(fname)           -- you can also pass in a function
          --   if fname:match("myproject") then
          --     return { "mygit" }
          --   end
          --   return { "upstream", "origin" }
          -- end,

          git_remote_push = false, -- use the push url for git issue linking,
        },
      }
    end,
  }
}
