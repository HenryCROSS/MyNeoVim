local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = function()
            -- vim.wo.foldlevel = 99 -- feel free to decrease the value
            -- vim.wo.foldenable = true
            vim.wo.foldlevel = 0 -- feel free to decrease the value
            vim.wo.foldenable = true
            require('ufo').setup()
        end

    },
}
