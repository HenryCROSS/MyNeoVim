local indentguides = {}
local indentguides_settings = require("indent_guides")

indentguides.load = function()
    indentguides_settings.setup {
        indent_levels = 30,
        indent_guide_size = 1,
        indent_start_level = 1,
        indent_enable = true,
        indent_space_guides = true,
        indent_tab_guides = false,
        indent_soft_pattern = '\\s',
        exclude_filetypes = {
            'help', 'dashboard', 'dashpreview', 'NvimTree', 'vista', 'sagahover', 'fzf',
        },
        even_colors = {fg = '#ffffff', bg = '#332b36'},
        odd_colors = {fg = '#ffffff', bg = '#2a3834'}
    }
end

return indentguides
