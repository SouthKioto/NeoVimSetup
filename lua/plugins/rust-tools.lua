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
        dap = {
          adapter = dap_adapter,
        },
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",
  },
}
