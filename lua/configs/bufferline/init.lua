local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "akinsho/bufferline.nvim",
        config = function()
            require("configs.bufferline.configs")
        end

    },
}

