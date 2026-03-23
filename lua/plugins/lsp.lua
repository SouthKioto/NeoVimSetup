return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "intelephense", "clangd" },
            })

            local servers = {
                "lua_ls",
                "pyright",
                "ts_ls",
                "html",
                "cssls",
                "jsonls",
                "tailwindcss",
                "intelephense",
                "clangd",
            }

            -- Ścieżka do g++ (pamiętaj o / zamiast \)
            local gpp_path = "C:/msys64/ucrt64/bin/g++.exe"

            -- 1. Definiujemy specyficzne konfiguracje

            -- Konfiguracja dla Lua
            vim.lsp.config("lua_ls", {
                settings = { Lua = { diagnostics = { globals = { "vim" } }, format = { enable = false } } },
            })

            -- Konfiguracja dla Clangd (naprawa bibliotek standardowych)
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--query-driver=" .. gpp_path,
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                },
            })

            -- 2. Włączamy wszystkie serwery z listy
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },
}
