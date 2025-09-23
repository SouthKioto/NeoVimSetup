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
          --"ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "rust_analyzer",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        opts = {
          ft = {
            "tsx",
            "ts",
            "js",
            "jsx",
            "rs",
            "py",
          },
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local buf_map = function(mode, lhs, rhs)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
        end

        buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
      end

      local servers = {
        lua_ls = {},
        pyright = {},
        rust_analyzer = {
          root_dir = lspconfig.util.root_pattern("Cargo.toml"),
          settings = {
            ["rust_analyzer"] = {
              cargo = { allFeatures = true },
            },
          },
        },
      }

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust_analyzer"] = {
            cargo = { allFeatures = true },
          },
        },
      })

      vim.lsp.config("pyright", {})

      vim.lsp.config("lua_ls", {})

      --[[for server, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach

        if vim.lsp.config and vim.lsp.config[server] then
          -- nowe API Neovim 0.11+
          local lsp_conf = vim.lsp.config[server].make(config)
          vim.lsp.start(lsp_conf)
        else
          -- fallback dla starszego API
          require("lspconfig")[server].setup(config)
        end
      end]]
      --
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
          async = false,
          quiet = false,
          lsp_format = "fallback",
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
