local colorizer = {}
local colorizer_settings = require('colorizer')

colorizer.load = function ()
    colorizer_settings.setup{
        '*'
    }
end
return colorizer
