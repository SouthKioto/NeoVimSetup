return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- Default options:
            require("kanagawa").setup({
                compile = false, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false, -- do not set background color
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = { -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave", -- Load "wave" theme
                background = { -- map the value of 'background' option to a theme
                    dark = "dragon", -- try "dragon" !
                    light = "lotus",
                },
            })
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    globalstatus = true,
                    component_separators = { left = "⏐", right = "⏐" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            fmt = function(str)
                                return "󰇄  " .. str
                            end,
                        },
                    },
                    lualine_b = {
                        { "branch", icon = "󱓞" },
                        "diff",
                    },
                    lualine_c = {
                        { "filename", symbols = { modified = " 󰝥", readonly = " 󰌾" } },
                    },
                    lualine_x = { "diagnostics" },
                    lualine_y = {
                        { "filetype", icon_only = true },
                        {
                            function()
                                return "Urahara's Shop"
                            end,
                        },
                    },
                    lualine_z = { "location" },
                },
            })
        end,
    },

    {
        "goolord/alpha-nvim",
        config = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⡿⢿⡿⠿⠿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⡿⣿⣿]],
                [[⣿⣿⣿⣿⠿⠿⢿⣿⣿⠟⣋⣭⣶⣶⣞⣿⣶⣶⣶⣬⣉⠻⣿⣿⡿⣋⣉⠻⣿⣿⣿]],
                [[⣿⢻⣿⠃⣤⣤⣢⣍⣴⣿⢋⣵⣿⣿⣿⣿⣷⣶⣝⣿⣿⣧⣄⢉⣜⣥⣜⢷⢹⢇⢛]],
                [[⡏⡦⡁⡸⢛⡴⢣⣾⢟⣿⣿⣿⢟⣾⣧⣙⢿⣿⣿⣿⣿⣿⣿⣿⢩⢳⣞⢿⡏⢷⣾]],
                [[⣷⣵⡇⣗⡾⢁⣾⣟⣾⣿⡿⣻⣾⣿⣿⣿⡎⠛⡛⢿⣿⡟⣿⣿⡜⡜⢿⡌⠇⢾⣿]],
                [[⣿⣿⠁⣾⠏⣾⣿⣿⣽⣑⣺⣥⣿⣿⣿⣿⣷⣶⣦⣖⢝⢿⣿⣿⣿⡀⠹⣿⣼⢸⣿]],
                [[⣿⣿⢰⡏⢡⣿⣿⠐⣵⠿⠛⠛⣿⣿⣿⣿⣿⠍⠚⢙⠻⢦⣼⣿⣿⠁⣄⣿⣿⠘⣿]],
                [[⣿⣿⢸⢹⢈⣿⣿⠘⣡⡞⠉⡀⢻⣿⣿⣿⣿⢃⠠⢈⢳⣌⣩⣿⣿⠰⠿⢼⣿⠀⣿]],
                [[⣿⠿⣘⠯⠌⡟⣿⡟⣾⣇⢾⡵⣹⣟⣿⣿⣿⣮⣓⣫⣿⣟⢿⣿⢿⡾⡹⢆⣦⣤⢹]],
                [[⣅⣛⠶⠽⣧⣋⠳⡓⢿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣫⣸⠏⡋⠷⣛⣫⡍⣶⣿]],
                [[⣿⡿⢸⢳⣶⣶⠀⡇⣬⡛⠿⣿⣿⣿⣿⣿⣿⣿⠿⢟⣉⣕⡭⠀⢺⣸⣽⢻⡅⣿⣿]],
                [[⣿⡇⣾⡾⣰⡯⠀⡗⣯⣿⣽⡶⠶⠂⢠⣾⣿⠐⠚⠻⢯⣿⠇⠎⡀⣳⣿⣼⡃⣿⣿]],
                [[⣿⡇⣟⣇⡟⣧⠀⡗⣿⣿⡿⢡⢖⣀⠼⢟⣻⣤⣔⢦⢸⣿⢀⢆⢡⣿⣯⢹⡃⣿⣿]],
                [[⣿⡇⡏⣿⡾⣸⣿⣇⠸⠟⣋⣼⣼⣿⢻⣿⣿⢿⣟⢾⣌⠫⠈⣶⣿⡿⣩⡿⢃⣿⣿]],
                [[⣿⣷⡀⠻⡷⢪⢧⡙⠰⣾⣿⣿⣾⡽⣾⣿⡿⣺⣵⣾⣿⡇⡜⣽⠟⢷⣪⣴⣿⣿⣿]],
                [[⣿⣿⣿⣾⣿⠏⣤⡁⣷⣽⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⣿⣱⠸⣱⣦⠙⣿⣿⣿⣾⣿]],
            }

            local quote = {
                type = "text",
                val = "“Oryahou! There is no point in a warrior without a weapon.”",
                opts = {
                    hl = "AlphaFooter",
                    position = "center",
                },
            }

            dashboard.config.layout = {
                { type = "padding", val = 2 },
                dashboard.section.header,
                { type = "padding", val = 1 },
                quote,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                dashboard.section.footer,
            }

            dashboard.section.buttons.val = {
                dashboard.button("n", "󰏪  Open the Candy Shop", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "󰈞  Seek Reiryoku (Files)", ":Telescope find_files <CR>"),
                dashboard.button("r", "󰦛  Past Incarnations (Recent)", ":Telescope oldfiles <CR>"),
                dashboard.button("s", "󱓞  Awaken Benihime (Settings)", ":e $MYVIMRC <CR>"),
                dashboard.button("q", "󰈆  Return to Karakura Town", ":qa<CR>"),
            }

            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"

            require("alpha").setup(dashboard.config)
        end,
    },
    {
        "nvim-zh/colorful-winsep.nvim",
        config = function()
            require("colorful-winsep").setup({})
        end,
        event = { "WinLeave" },
    },

    {
        "eandrju/cellular-automaton.nvim",
    },
}
