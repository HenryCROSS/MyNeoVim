local telescope = {}
local telescope_settings = require('telescope')

telescope.load = function()
    telescope_settings.setup {
        mappings = {
            i = {
                --
                -- ["<C-j>"] = 'move_selection_next',
                -- ["<C-k>"] = 'move_selection_previous'
            }
        }
    }

    vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', {})
end

return telescope
