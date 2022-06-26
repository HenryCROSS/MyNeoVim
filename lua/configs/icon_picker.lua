local PROPERTY = api_o_const.PROPERTY
local opts = { noremap = true, silent = true }

return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        requires = "stevearc/dressing.nvim",
        name = "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker")

        end
    },
}
