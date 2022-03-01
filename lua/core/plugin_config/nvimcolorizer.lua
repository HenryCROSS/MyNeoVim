local colorizer = {}
local colorizer_settings = require('colorizer')

colorizer.name = "norcalli/nvim-colorizer.lua"

colorizer.load = function ()
    colorizer_settings.setup{
        '*'
    }
end
return colorizer
