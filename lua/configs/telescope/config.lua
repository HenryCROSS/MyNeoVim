require("telescope").setup {
    defaults = {
        layout_strategy = "bottom_pane",
        layout_config = {
            bottom_pane = {
                height = 15,
                preview_cutoff = 100,
                prompt_position = "bottom",
            },
        },
    },
    pickers = {
        oldfiles = {
        },
        find_files = {
            hidden = true
        },
        live_grep = {
        },
        buffers = {
            ignore_current_buffer = true,
            sort_mru = true
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
        asynctasks = {
            theme = "ivy",
        },
        media_files = {
            theme = "ivy",
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
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

api_o_keymap.set('n', '<Leader>,', '<cmd>Telescope buffers<CR>', { desc = "List Buffers" })
api_o_keymap.set('n', '<Leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = "Open Recent File" })
api_o_keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find File" })
api_o_keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { desc = "Find String" })
api_o_keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { desc = "List Buffers" })
api_o_keymap.set('n', '<Leader>fs', '<cmd>Telescope grep_string<cr>', { desc = "Find This String" })
