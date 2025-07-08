return {
  "goolord/alpha-nvim",

  event = "VimEnter",
  enabled = true,
  init = false,

  config = function()
    require("alpha").setup(require("alpha.themes.dashboard").config)
  end,
}
