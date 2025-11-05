return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "│",
            tab_char = "│",
            highlight = "IblIndent", -- używamy domyślnej na start
            smart_indent_cap = true,
            priority = 2,
        },
        scope = {
            enabled = true,
            show_start = true,
            show_end = false,
            highlight = "IblScope",
            injected_languages = true,
            include = {
                node_type = {
                    ["*"] = { "*" }
                }
            },
        },
        exclude = {
            filetypes = { "help", "terminal", "dashboard" },
            buftypes = { "terminal", "nofile" },
        },
    },
    config = function(_, opts)
        local ibl = require("ibl")

        -- highlighty tworzymy przed setupem
        local colors = {
            IblIndent1 = "#3B4261",
            IblIndent2 = "#4B5263",
            IblIndent3 = "#5C6370",
            IblIndent4 = "#6C7086",
            IblScope1  = "#7AA2F7",
            IblScope2  = "#FFCB6B",
        }
        for hl, col in pairs(colors) do
            vim.api.nvim_set_hl(0, hl, { fg = col })
        end

        ibl.setup(opts)
    end,
}
