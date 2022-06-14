local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "nvim-telescope/telescope.nvim",
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require("configs.telescope.config")
        end

    },
}
