return {
    "stevearc/conform.nvim",
    timeout_ms = 2000,
    lsp_fallback = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            php = { "php-cs-fixer", stop_after_first = true },
            c = { "clang-format", stop_after_first = true },
            cpp = { "clang-format", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
