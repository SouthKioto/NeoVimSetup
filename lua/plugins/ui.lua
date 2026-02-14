local function hl_color(group, attr)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if not ok or not hl then
        return nil
    end
    local val = hl[attr]
    if not val then
        return nil
    end
    return string.format("#%06x", val)
end

local function get_colors()
    return {
        bg = hl_color("Normal", "bg") or "#0e100c",
        fg = hl_color("Normal", "fg") or "#eeede8",
        accent = hl_color("Keyword", "fg") or "#586d4a",
        accent2 = hl_color("Operator", "fg") or "#92bf7a",
        type = hl_color("Type", "fg") or "#b5a97a",
        fg_dim = hl_color("Comment", "fg") or "#9a9790",
        bg_alt = hl_color("NormalFloat", "bg") or "#121510",
        bg_dark = hl_color("CursorLine", "bg") or "#22211f",
        visual = hl_color("Visual", "bg") or "#1e2b19",
    }
end

return {
    {
        "SouthKioto/urahara.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("urahara").setup()
            vim.g.colors_name = "urahara"
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local c = get_colors()
            local theme = {
                normal = {
                    a = { fg = c.bg, bg = c.accent, gui = "bold" },
                    b = { fg = c.accent2, bg = c.bg_alt },
                    c = { fg = c.fg_dim, bg = c.bg },
                },
                insert = {
                    a = { fg = c.bg, bg = c.accent2, gui = "bold" },
                    b = { fg = c.accent2, bg = c.bg_alt },
                },
                visual = {
                    a = { fg = c.bg, bg = c.type, gui = "bold" },
                    b = { fg = c.type, bg = c.bg_alt },
                },
                replace = {
                    a = { fg = c.bg, bg = c.type, gui = "bold" },
                    b = { fg = c.type, bg = c.bg_alt },
                },
                command = {
                    a = { fg = c.bg, bg = c.fg_dim, gui = "bold" },
                    b = { fg = c.fg_dim, bg = c.bg_alt },
                },
                inactive = {
                    a = { fg = c.fg_dim, bg = c.bg_alt },
                    b = { fg = c.fg_dim, bg = c.bg_alt },
                    c = { fg = c.fg_dim, bg = c.bg },
                },
            }

            require("lualine").setup({
                options = {
                    theme = theme,
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
                            color = { fg = c.accent },
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
            local c = get_colors()

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

            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = c.accent, bold = true })
            vim.api.nvim_set_hl(0, "AlphaButtons", { fg = c.accent2 })
            vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = c.type, bold = true })
            vim.api.nvim_set_hl(0, "AlphaFooter", { fg = c.fg_dim, italic = true })

            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"

            require("alpha").setup(dashboard.config)
        end,
    },
    {
        "nvim-zh/colorful-winsep.nvim",
        config = function()
            local c = get_colors()
            require("colorful-winsep").setup({
                color = { c.bg_dark, c.accent, c.accent2 },
            })
        end,
        event = { "WinLeave" },
    },

    {
        "eandrju/cellular-automaton.nvim",
    },
}
