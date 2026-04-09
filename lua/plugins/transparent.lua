return {
    "tribela/transparent.nvim",
    config = true,
    lazy = false,
    priority = 1000,

    config = function()
        require("transparent").setup({})
    end,
}
