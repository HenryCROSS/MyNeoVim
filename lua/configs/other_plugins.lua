local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "Pocco81/AutoSave.nvim",
        config = function()
            require("autosave").setup {
                enabled = true,
                execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
                events = { "InsertLeave", "TextChanged" },
                conditions = {
                    exists = true,
                    filename_is_not = {},
                    filetype_is_not = {},
                    modifiable = true
                },
                write_all_buffers = true,
                on_off_commands = true,
                clean_command_line_interval = 0,
                debounce_delay = 135
            }
        end

    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "famiu/bufdelete.nvim",
        config = function()
            api_o_keymap.set("n", "<Leader>bk", "<cmd>Bdelete<CR>", { noremap = true, desc = "Delect current buffer" })
        end
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "tpope/vim-fugitive",
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "kyazdani42/nvim-web-devicons",
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "tpope/vim-fugitive",
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "sharkdp/fd",
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "nixprime/cpsm",
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "romgrk/fzy-lua-native",
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "skywind3000/asynctasks.vim",
        config = function()
            vim.g.asynctasks_extra_config = {
                '~/.config/nvim/global_task/tasks.ini'
            }
        end
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "skywind3000/asyncrun.vim",
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>ar", ":AsyncRun ", {})
            vim.api.nvim_set_keymap("v", "<leader>ar", ":'<,'>AsyncRun ", {})
            vim.g.asyncrun_rootmarks = { '.git', '.svn', '.root', '.project', '.hg' }
            vim.g.asynctasks_term_pos = 'bottom'
            vim.g.asynctasks_term_rows = 12
            vim.g.asyncrun_open = 12
        end
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup({
                force = true, -- stabilize window even when current cursor position will be hidden behind new window
                forcemark = nil, -- set context mark to register on force event which can be jumped to with '<forcemark>
                ignore = { -- do not manage windows matching these file/buftypes
                    filetype = { "help", "list", "Trouble" },
                    buftype = { "terminal", "quickfix", "loclist" }
                },
                nested = nil -- comma-separated list of autocmds that wil trigger the plugins window restore function
            })
        end
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = 'ethanholz/nvim-lastplace',
        config = function ()
            require'nvim-lastplace'.setup {
                lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                lastplace_open_folds = true
            }
        end
    },
    {
        -- speed up start time
        type = PROPERTY.PLUGIN_CONFIG,
        name = "lewis6991/impatient.nvim",
        config = function ()
            local _, _ = pcall(require, "impatient")
        end
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "rafamadriz/friendly-snippets",
    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "honza/vim-snippets",
    },
}
