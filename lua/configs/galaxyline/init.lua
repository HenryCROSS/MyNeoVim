local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "glepnir/galaxyline.nvim",
        config = function()
            require("configs.galaxyline.config")
        end

    },
}
