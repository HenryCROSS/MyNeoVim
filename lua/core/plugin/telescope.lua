local telescope = {}
local telescope_settings = require('telescope')

telescope.load = function()
    telescope_settings.setup {
        mappings = {
            i = {
                --
            }
        }
    }
end

return telescope
