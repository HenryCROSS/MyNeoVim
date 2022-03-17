local telescope = {}
local telescope_settings = require('telescope')
local wk = require("which-key")

telescope.name = "nvim-telescope/telescope.nvim"

telescope.load = function()

    telescope_settings.setup {
        pickers = {
            oldfiles = {
                theme = "ivy",
            },
            find_files = {
                theme = "ivy",
            },
            live_grep = {
                theme = "ivy",
            },
            buffers = {
                theme = "ivy",
            },
        },
        mappings = {
            i = {
                --
                -- ["<C-j>"] = 'move_selection_next',
                -- ["<C-k>"] = 'move_selection_previous'
            }
        },
        extensions = {
            media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = {"png", "webp", "jpg", "jpeg"},
                find_cmd = "rg" -- find command (defaults to `fd`)
            },
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            },
            file_browser = {
                theme = "ivy",
                mappings = {
                    ["i"] = {
                        -- your custom insert mode mappings
                    },
                    ["n"] = {
                        -- your custom normal mode mappings
                    }
                }
            }
        }
    }

    -- vim.api.nvim_set_keymap('n', '<Leader>bl', ':Telescope buffers<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>,', ':Telescope buffers<CR>', {})
    --
    -- -- files
    -- vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope oldfiles<CR>', {})
    -- -- vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope frecency<CR>', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>',
    --                         {})
    -- vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>",
    --                         {noremap = true})

    wk.register({
            f = {
                name = 'File',
                o = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
                f = {"<cmd>Telescope find_files<cr>", "Find File"},
                g = {"<cmd>Telescope live_grep<cr>", "Find String"},
                b = {"<cmd>Telescope file_browser<cr>", "Open File Manager"},
            },
            b = {
                name = "Buffer",
                l = {"<cmd>Telescope buffers<cr>", "List Buffers"}
            }
        }, {prefix = "<leader>"})
end

return telescope
