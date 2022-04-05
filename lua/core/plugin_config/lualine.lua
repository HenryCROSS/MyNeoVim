local lualine = {}
local lualine_settings = require('lualine')
-- local gps = require("nvim-gps")

lualine.name = "nvim-lualine/lualine.nvim"

lualine.load = function()
    lualine_settings.setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            -- lualine_c = {'filename', { gps.get_location, cond = gps.is_available }},
            lualine_x = {'filename', 'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {'nvim-tree', 'fzf'}
    }
    vim.cmd[[highlight WinSeparator guifg=#545c7e]]
end

return lualine
