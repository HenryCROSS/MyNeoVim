local PROPERTY = api_o_const.PROPERTY
return {
	{
		type = PROPERTY.PLUGIN_CONFIG,
		name = "neoclide/coc.nvim",
		branch = "release",
		config = function ()
			require("configs.coc.config")
		end

	},
}