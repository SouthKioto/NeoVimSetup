return {
    -- Rust Tools
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        config = function()
            local rt = require("rust-tools")
            local dap_adapter = require("rust-tools.dap").get_codelldb_adapter(
                vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
            )
            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, { buffer = bufnr })
                        vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables, { buffer = bufnr })
                    end,
                },
                dap = { adapter = dap_adapter },
            })
        end,
    },

    -- nvim-dap
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- Konfiguracja adaptera codelldb dla C/C++
            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                    args = {"--port", "${port}"},
                }
            }

            -- Konfiguracja dla C++ i C
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
            dap.configurations.c = dap.configurations.cpp
        end,
    },

    -- mason-nvim-dap
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            'williamboman/mason.nvim',
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },

    -- nvim-neotest dependency
    {
        "nvim-neotest/nvim-nio",
    },

    -- DAP UI
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup({
                layouts = {
                    {
                        elements = { "repl", "console" },
                        size = 40,
                        position = "right",
                    },
                },
            })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}
