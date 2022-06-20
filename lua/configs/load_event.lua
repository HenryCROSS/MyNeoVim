local PROPERTY = api_o_const.PROPERTY

return {
    {
        type = PROPERTY.LOAD_EVENT,
        event = "BufWinLeave",
        plugins = {
            "folke/tokyonight.nvim",
        },
        groups = {

        }
    },
}
