return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",

        event = { "BufReadPost", "BufNewFile" },

        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "python",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "json",
                    "php",
                    "c",
                    "cpp",
                },
                highlight = { enable = true },
                indent = { enable = true },
                auto_install = true,
            })
        end,
    },
}
