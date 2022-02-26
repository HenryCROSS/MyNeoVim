local telescope = {}
local telescope_settings = require('telescope')

telescope.load = function()
    telescope_settings.load_extension('media_files')
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
            }
        }
    }

    vim.api.nvim_set_keymap('n', '<Leader>bl', ':Telescope buffers<CR>', {})

    -- files
    vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope oldfiles<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', {})
end

return telescope
