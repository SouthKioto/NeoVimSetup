return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "intelephense", "clangd" },
            })

            local servers =
                { "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "tailwindcss", "intelephense", "clangd" }

            for _, server in ipairs(servers) do
                vim.lsp.enable(server)

                if server == "lua_ls" then
                    vim.lsp.config("lua_ls", {
                        settings = { Lua = { format = { enable = false } } },
                    })
                end
            end
        end,
    },
}
