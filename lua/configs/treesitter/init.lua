local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("configs.treesitter.configs").treesitter_configs()
        end

    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        requires = "nvim-treesitter/nvim-treesitter",
        name = "nvim-treesitter/nvim-treesitter-textobjects",
    },
}
