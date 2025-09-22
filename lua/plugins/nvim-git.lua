return {
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
  },

  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
      require("git-worktree").setup()
    end,
  },
}
