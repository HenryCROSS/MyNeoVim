local PROPERTY = api_o_const.PROPERTY
return {
	{
		type = PROPERTY.PLUGIN_CONFIG,
		name = "luochen1990/rainbow",
		config = function ()
			vim.g.rainbow_active = 1
		end

	},
}