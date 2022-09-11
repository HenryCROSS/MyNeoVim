local PROPERTY = api_o_const.PROPERTY
return {
	{
		type = PROPERTY.PLUGIN_CONFIG,
		name = "neoclide/coc.nvim",
		branch = "release",
        -- commit = "5fce9a5",
        run = 'yarn install --frozen-lockfile',
		config = function ()
			require("configs.coc.config")
		end

	},
}
