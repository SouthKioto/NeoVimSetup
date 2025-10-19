vim.g.mapleader = " "

--filter
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })

--escape from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

--nvim tree
vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal float<CR>", { noremap = true, silent = true })

-- bufory
-- Przejdź do następnego bufora
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Następny bufor" })
-- Przejdź do poprzedniego bufora
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Poprzedni bufor" })

vim.keymap.set("n", "<leader>bc", "<Cmd>bd<CR>", { desc = "Zamknij bieżący bufor" })

--okna
-- Podziel poziomo
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Podziel poziomo" })

-- Podziel pionowo
vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Podziel pionowo" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Do okna w lewo" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Do okna w prawo" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Do okna w dół" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Do okna w górę" })

vim.keymap.set("n", "<A-Left>", "<C-w><", { desc = "Zmniejsz szerokość" })
vim.keymap.set("n", "<A-Right>", "<C-w>>", { desc = "Zwiększ szerokość" })
vim.keymap.set("n", "<A-Up>", "<C-w>+", { desc = "Zwiększ wysokość" })
vim.keymap.set("n", "<A-Down>", "<C-w>-", { desc = "Zmniejsz wysokość" })

vim.keymap.set("n", "<leader>sx", "<Cmd>close<CR>", { desc = "Zamknij split" })

-- debugowanie
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint <CR>", { desc = "Dodanie breakpointa" });
vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue <CR>", { desc = "Rozpocznij lub kontunuuj debugowanie" });

--git-worktree
-- otwarcie listy worktree'ów
vim.keymap.set("n", "<leader>gw", function()
    require("telescope").extensions.git_worktree.git_worktrees()
end, { desc = "List Git Worktrees" })

-- utworzenie nowego worktree
vim.keymap.set("n", "<leader>gc", function()
    require("telescope").extensions.git_worktree.create_git_worktree()
end, { desc = "Create Git Worktree" })

--lazydocker

vim.keymap.set({ "n", "t" }, "<leader>ld", "<Cmd>lua LazyDocker.toggle()<CR>")

--terminal
vim.keymap.set("n", "<leader>;", "<Cmd>:ToggleTerm size=50 direction=vertical<CR>", { desc = "Vertical term size 50" })

--troublenvim
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostic (Trouble)" })
vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = " Symbols (Trouble)" })
vim.keymap.set(
    "n",
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)" }
)

vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = " Location List (Trouble)" })

vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- todo comments + telescope
vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Todo (Telescope)" })
vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<cr>", { desc = "Todo (QuickFix)" })

-- live serwer
vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<cr>", { desc = "Live server start" })
vim.keymap.set("n", "<leader>lx", "<cmd>LiveServerStop<cr>", { desc = "Live server stop" })
