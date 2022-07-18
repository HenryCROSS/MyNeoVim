local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("configs.null-ls.configs")
        end

    },
}
