local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "akinsho/toggleterm.nvim",
        tag = 'v1.*',
        config = function()
            require("configs.toggle_term.configs")
        end

    },
}
