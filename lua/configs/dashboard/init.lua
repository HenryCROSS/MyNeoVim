local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "glepnir/dashboard-nvim",
        config = function()
            require("configs.dashboard.config")
        end

    },
}
