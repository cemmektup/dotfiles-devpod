return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      local nmap = require("user.keymap").nmap
      local harpoon = require "harpoon"
      harpoon.setup {}
      nmap { "<leader>bm", require("harpoon.mark").add_file, { silent = true, desc = "mark file" } }
      -- nmap { "<M-h><M-m>", require("harpoon.mark").add_file }
      nmap { "<leader>bo", require("harpoon.ui").toggle_quick_menu, { silent = true, desc = "Harpoon UI" } }
      nmap { "<leader><leader>h", require("harpoon.ui").toggle_quick_menu, { silent = true, desc = "Harpoon UI" } }

      local keys = { "h", "j", "k", "l" }
      for i, key in ipairs(keys) do
        nmap {
          string.format("<leader>b%s", key),
          function()
            require("harpoon.ui").nav_file(i)
          end,
          { silent = true, desc = string.format("Navigation file %s", key) },
        }
      end
      -- for i = 1, 4 do
      --   nmap {
      --     string.format("<space>b%s", i),
      --     function()
      --       require("harpoon.ui").nav_file(i)
      --     end,
      --   }
      -- end
    end,
  },
}
