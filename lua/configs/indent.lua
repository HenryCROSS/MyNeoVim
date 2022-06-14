local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.list = true
            -- vim.opt.listchars:append("eol:↴")

            require("indent_blankline").setup {
                -- show_end_of_line = true,
            }
        end

    },
}
