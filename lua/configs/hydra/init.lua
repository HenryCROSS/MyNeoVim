local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        requires = 'anuvyklack/keymap-layer.nvim',
        name = "anuvyklack/hydra.nvim",
        config = function()
            require("configs.hydra.configs")
        end

    },
}

