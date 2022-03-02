local telescope = {}
local telescope_settings = require('telescope')

telescope.name = "nvim-telescope/telescope.nvim"

telescope.load = function()
    telescope_settings.load_extension('media_files')

    -- it is very annoying to setup these in Windows, fuck it
    if vim.loop.os_uname().sysname ~= "Windows_NT" then
        telescope_settings.load_extension('fzf')
    end

    telescope_settings.setup {
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
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            }
        }
    }

    vim.api.nvim_set_keymap('n', '<Leader>bl', ':Telescope buffers<CR>', {})

    -- files
    vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope oldfiles<CR>', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope frecency<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', {})
end

return telescope
