local PROPERTY = api_o_const.PROPERTY
return {
    {
        -- type = PROPERTY.PLUGIN_CONFIG,
        name = "nanozuki/tabby.nvim",
        config = function()
            require("configs.tabby.config")
        end

    },
}
