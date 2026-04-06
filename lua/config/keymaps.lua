local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "Okno ←" })
map("n", "<C-j>", "<C-w>j", { desc = "Okno ↓" })
map("n", "<C-k>", "<C-w>k", { desc = "Okno ↑" })
map("n", "<C-l>", "<C-w>l", { desc = "Okno →" })

map("n", "<leader>wv", "<C-w>v", { desc = "Split pionowy" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split poziomy" })
map("n", "<leader>wc", "<C-w>c", { desc = "Zamknij okno" })

map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Explorer" })

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Znajdź pliki" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Szukaj (grep)" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Bufory" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })

map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Następny buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Poprzedni buffer" })

map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Zamknij buffer" })
map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Wybierz buffer" })

map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Terminal toggle" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "Terminal poziomy" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "Terminal pionowy" })

map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Wyjdź z terminala" })

map("n", "<leader>ut", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })

map("n", "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Matrix rain 😎" })

map("n", "<leader>lp", function()
    vim.cmd("LivePreview start " .. vim.fn.expand("%:p"))
end, { desc = "Preview start" })

map("n", "<leader>lq", "<cmd>LivePreview close<CR>", { desc = "Preview stop" })
