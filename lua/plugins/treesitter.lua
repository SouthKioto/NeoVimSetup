return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
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
            })
        end,
    },
}
