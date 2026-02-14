return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded",
        },
        wrap = false,
    },

    config = function()
        require("lsp_signature").setup()
    end,
}
