return {
  "nvzone/showkeys",
  opts = {
    maxkeys = 5,
  },
  config = function(_, opts)
    require("showkeys").setup(opts)
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("ShowkeysToggle")
      end,
    })
  end,
}
