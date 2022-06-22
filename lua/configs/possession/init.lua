local PROPERTY = api_o_const.PROPERTY
return {
    {
        -- has bug
        -- type = PROPERTY.PLUGIN_CONFIG,
        name = "jedrzejboczar/possession.nvim",
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("configs.possession.configs")
        end

    },
}

