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
                ensure_installed = { "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "intelephense" },
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
            }
            local gpp_path = "g++"
            if vim.loop.os_uname().sysname == "Windows_NT" then
                gpp_path = "C:/msys64/clang64/bin/g++.exe"
            end

            vim.lsp.config("lua_ls", {
                settings = { Lua = { diagnostics = { globals = { "vim" } }, format = { enable = false } } },
            })

            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--query-driver=" .. gpp_path,
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                },
            })

            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },
}
