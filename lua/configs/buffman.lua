local PROPERTY = api_o_const.PROPERTY
return {
    {
        -- type = PROPERTY.SOURCE_PLUGIN,
        name = "buffman",
        config = function()
            require("buffman").setup({
            })

        end

    },
}

