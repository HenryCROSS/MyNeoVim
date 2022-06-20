local PROPERTY = api_o_const.PROPERTY
return {
	{
		type = PROPERTY.PLUGIN_CONFIG,
		name = "folke/tokyonight.nvim",
		config = function ()
			-- vim.api.nvim_command("colorscheme gruvbox-baby")
			-- vim.cmd[[colorscheme gruvbox-baby]]
			vim.g.tokyonight_style = "night"
			vim.g.tokyonight_italic_functions = true
			vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

			-- Change the "hint" color to the "orange" color, and make the "error" color bright red
			-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
			-- vim.cmd [[colorscheme tokyonight]]
			vim.api.nvim_command("colorscheme tokyonight")
		end

	},
}