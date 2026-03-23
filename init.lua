vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.smartindent = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"


require("config.lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
    },
    rocks = {
        enabled = false,
    },
    checker = {
        enabled = true,
    },
    ui = {
        border = "rounded",
        backdrop = 60,
    },
})

require("config.keymaps")


vim.cmd("colorscheme kanagawa")
