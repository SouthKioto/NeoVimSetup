return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    linters = {
      eslint = {
        args = {
          "--no-warn-ignored", -- <-- this is the key argument
          "--format",
          "json",
          "--stdin",
          "--stdin-filename",
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
      },
    },
  },

  config = function()
    local lint = require("lint")

    local eslint_bin = vim.fn.getcwd() .. "/node_modules/.bin/eslint"
    if vim.fn.filereadable(eslint_bin) == 1 then
      lint.linters.eslint.cmd = eslint_bin
    end

    lint.linters_by_ft = {
      fish = { "fish" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Wywołanie lintowania dla danego pliku" })
  end,
}
