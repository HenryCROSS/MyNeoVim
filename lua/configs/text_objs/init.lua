local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "kana/vim-textobj-user",
        config = function()
            require("configs.text_objs.configs")
        end

    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "michaeljsmith/vim-indent-object",
        config = function()
        end

    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "wellle/targets.vim",
        config = function()
        end

    },
}

