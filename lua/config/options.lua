-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.opt.termguicolors = true

vim.o.expandtab = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.cmd([[
  highlight DiagnosticVirtualTextError guifg=#ff6c6b guibg=#1e1e1e
  highlight DiagnosticVirtualTextWarn  guifg=#ECBE7B guibg=#1e1e1e
  highlight DiagnosticVirtualTextInfo  guifg=#51afef guibg=#1e1e1e
  highlight DiagnosticVirtualTextHint  guifg=#98be65 guibg=#1e1e1e
]])
