return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        "stylua",
        "flake8",
        "shellcheck",
        "shfmt",
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "bashls",
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },

        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt" },
          javascript = { "prettier", stop_after_first = true },
          typescript = { "prettier", stop_after_first = true },
          typescriptreact = { "prettier" },
          javascriptreact = { "prettier" },
          json = { "prettier", stop_after_first = true },
        },

        formatters = {
          --injected = { options = { ignore_errors = true } },
          prettier = {
            prepend_args = { "--single-quote", "--tab-width", "2" },
          },
        },

        format_on_save = {
          timeout_ms = 3000,
          async = false,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
