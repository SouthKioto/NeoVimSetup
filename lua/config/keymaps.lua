--windows management
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Przejdź do lewego okna" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Przejdź do dolnego okna" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Przejdź do górnego okna" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Przejdź do prawego okna" })

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split pionowy" })
vim.keymap.set("n", "<leader>s", "<C-w>s", { desc = "Split poziomy" })

-- Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })

-- bufferTabs
vim.keymap.set("n", "<leader>t", "<cmd>:BufferTabsToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { noremap = true, silent = true })

--telescope
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

--transparent toggle
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>", { desc = "Toggle Transparency" })

--stupid
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- life preview
vim.keymap.set("n", "<leader>lp", function()
    vim.cmd("LivePreview start " .. vim.fn.expand("%:p"))
end)
vim.keymap.set("n", "<leader>lpc", "<cmd>LivePreview close<CR>")
