return {
    "tpope/vim-dispatch",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "cpp",
            callback = function()
                vim.bo.makeprg = "g++ -Wall -std=c++20 % -o %:r"

                vim.bo.errorformat = "%f:%l:%c: %m,%f:%l: %m"
            end
        })
    end
}
