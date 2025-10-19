-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.schedule(function()
  vim.cmd([[
    highlight DiagnosticVirtualTextError guifg=#ff6c6b guibg=#1e1e1e
    highlight DiagnosticVirtualTextWarn  guifg=#ECBE7B guibg=#1e1e1e
    highlight DiagnosticVirtualTextInfo  guifg=#51afef guibg=#1e1e1e
    highlight DiagnosticVirtualTextHint  guifg=#98be65 guibg=#1e1e1e
  ]])
end)

