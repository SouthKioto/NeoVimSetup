return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "folke/todo-comments.nvim" },
  opts = {
    defaults = {
      -- ignoruj node_modules, dist, .git i inne
      file_ignore_patterns = {
        "node_modules/.*",
        "dist/.*",
        "%.git/.*",
      },
      -- jeśli chcesz też przy live_grep
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--glob",
        "!.git/",
        "--glob",
        "!node_modules/",
        "--glob",
        "!dist/",
      },
    },
  },
}
