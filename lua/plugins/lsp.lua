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

            local query_driver = "/usr/bin/g++,/usr/bin/clang++"
            if vim.loop.os_uname().sysname == "Windows_NT" then
                query_driver = "C:/msys64/clang64/bin/g++.exe,C:/msys64/clang64/bin/clang++.exe"
            end

            vim.lsp.config("lua_ls", {
                settings = { Lua = { diagnostics = { globals = { "vim" } }, format = { enable = false } } },
            })

            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--query-driver=" .. query_driver,
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                },
            })

            -- Włączanie wszystkich serwerów
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },
}
