return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,

        config = function()
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true, -- To sprawia, że ukryte pliki są widoczne
                        hide_dotfiles = false,
                        hide_gitignored = false, -- To kluczowe ustawienie
                        hide_by_name = {
                            -- ".DS_Store",
                            -- "thumbs.db",
                        },
                    },
                },
            })
        end,
    },
}
