local whichkey = {}
local whichkey_settings = require('which-key')
local config= {
	keymap1 = {

	}
}

whichkey.load = function ()
	whichkey_settings.register({

	})
	whichkey_settings.setup{ }
end

return whichkey