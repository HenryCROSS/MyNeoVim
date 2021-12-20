local gitsigns = {}
local gitsigns_settings = require('gitsigns')

gitsigns.load = function ()
	gitsigns_settings.setup()
end

return gitsigns