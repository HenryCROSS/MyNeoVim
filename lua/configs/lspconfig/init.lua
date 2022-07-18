local PROPERTY = api_o_const.PROPERTY
return {
	{
		-- type = PROPERTY.PLUGIN_CONFIG,
		name = "neovim/nvim-lspconfig",
		branch = "release",
		config = function ()
			require("configs.lspconfig.config")
		end

	},
}

