return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
  },
  lazy = false,

  opts = function(_, opts)
    local cmp = require("cmp")

    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }

    opts.mapping = cmp.mapping.preset.insert({
      ["<down>"] = cmp.mapping.select_next_item(),
      ["<up>"] = cmp.mapping.select_prev_item(),
      ["Tab"] = cmp.mapping.confirm(),
    })

    opts.sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }

    opts.window = {
      documentation = cmp.config.window.bordered({
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      }),
      completion = cmp.config.window.bordered({
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      }),
    }
  end,
}
