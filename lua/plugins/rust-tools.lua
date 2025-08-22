return {
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local rt = require("rust-tools")
      local dap_adapter = require("rust-tools.dap").get_codelldb_adapter(
        vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
      )
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, { buffer = bufnr })
            vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables, { buffer = bufnr })
          end,
        },
        dap = { adapter = dap_adapter },
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function() end, -- wymagane dla prawidłowego ładowania
  },

  {
    "nvim-neotest/nvim-nio", -- konieczna zależność dla dap-ui
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio", -- <- tu dodajemy nvim-nio
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({
        layouts = {
          {
            elements = { "repl", "console" },
            size = 40,
            position = "right",
          },
        },
      })
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
