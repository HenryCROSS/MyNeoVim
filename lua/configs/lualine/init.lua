local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "nvim-lualine/lualine.nvim",
        config = function()
            require("configs.lualine.config")
        end

    },
}