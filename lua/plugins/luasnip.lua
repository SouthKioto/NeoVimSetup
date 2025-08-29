return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "v2.*",
  build = "make install_jsregexp",

  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Keymapy jak w VSCode
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if ls.expand_or_locally_jumpable() then
        return "<Plug>luasnip-expand-or-jump"
      else
        return "<Tab>"
      end
    end, { expr = true, silent = true })

    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      if ls.jumpable(-1) then
        return "<Plug>luasnip-jump-prev"
      else
        return "<S-Tab>"
      end
    end, { expr = true, silent = true })
  end,
}
