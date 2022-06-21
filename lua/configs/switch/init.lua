local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "AndrewRadev/switch.vim",
        config = function()
            require("configs.switch.configs")
        end

    },
}
