require("config.lazy")
require("config.options")
require("config.keymaps")

require("typescript-tools").setup({})

require("lualine").setup()
require("todo-comments").setup()

require("live-server").setup()

require("bufferline").setup()
require("neo-tree").setup()

require("lazydocker")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
