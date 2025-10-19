return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        settings = {
          tsserver_max_memory = 8192,
          separate_diagnostic_server = false,
          publish_diagnostic_on = "save",
          expose_as_code_action = "all",
        },
      })
    end,
  },
}
