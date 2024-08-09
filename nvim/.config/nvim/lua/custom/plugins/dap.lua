return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()

      -- Handled php
      local php_debug_adapter = vim.fn.exepath "php-debug-adapter"
      if php_debug_adapter ~= "" then
        dap.adapters.php = {
          type = "executable",
          command = php_debug_adapter,
        }


        -- Handled php by launch.json
        if vim.fn.filereadable(".vscode/launch.json") then
          require("dap.ext.vscode").load_launchjs(nil, { php = { "php" } })
        end

        --   dap.configurations.php = {
        --     {
        --       type = "php",
        --       request = "launch",
        --       name = "Listen for Xdebug (PHP)",
        --       port = 9003,
        --       ignore = { "**/vendor/**/*.php", "/tools/**/*" },
        --       pathMappings = {
        --         ['/srv/app'] = "${workspaceFolder}/app",
        --       },
        --       xdebugSettings = {
        --         max_data = -1
        --       },
        --       exitAfterTaskReturns = false,
        --       debugAutoInterpretAllModules = false,
        --     },
        --   }
      end


      vim.keymap.set("n", "<space>tb", dap.toggle_breakpoint,
        { silent = true, noremap = true, desc = "[T]oggle breakpoint" })
      vim.keymap.set("n", "<space>vb", dap.toggle_breakpoint,
        { silent = true, noremap = true, desc = "Toggle [B]reakpoint" })
      vim.keymap.set("n", "<space>vr", dap.run_to_cursor, { silent = true, noremap = true, desc = "Run to cursor" })
      vim.keymap.set("n", "<space>vo", ui.open, { silent = true, noremap = true, desc = "[O]pen" })
      vim.keymap.set("n", "<space>vq", ui.close, { silent = true, noremap = true, desc = "[Q]uit" })
      vim.keymap.set("n", "<space>vv", ui.toggle, { silent = true, noremap = true, desc = "[V]iew toggle" })
      vim.keymap.set("n", "<space>vr", ":lua require('dapui').open({reset = true})<CR>",
        { silent = true, noremap = true, desc = "[R]eset debugger" })

      vim.keymap.set("n", "<space>vc", ":lua require('dap').clear_breakpoints()<CR>",
        { silent = true, noremap = true, desc = "[C]lear breakpoints" })

      -- Eval var under cursor
      -- vim.keymap.set("n", "<space>?", function()
      --   require("dapui").eval(nil, { enter = true })
      -- end)

      vim.keymap.set("n", "<space>?", ":lua require('dapui').eval(nil, { enter = true })<CR>",
        { silent = true, noremap = true, desc = "[E]val Variable" })

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F9>", dap.restart)



      vim.keymap.set("n", "<space>vf", "<CMD>!make xdebug.off<CR>",
        { silent = true, noremap = true, desc = "Off xdebug" })
      vim.keymap.set("n", "<space>vx", "<CMD>!make xdebug.on<CR>", { silent = true, noremap = true, desc = "On xdebug" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
