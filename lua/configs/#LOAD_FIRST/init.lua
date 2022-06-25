local PROPERTY = api_o_const.PROPERTY
local configs = require("configs.#LOAD_FIRST.configs")

return {
    {
        type = PROPERTY.LOAD_FUNC,
        fn = function(args)
            local ok, packer = pcall(require, "packer")
            if ok then
                packer.init(args)
            end
        end,
        args = configs.packer_config

    },
    {
        type = PROPERTY.LOAD_FUNC,
        fn = function()
            local ok, obj = pcall(require, "impatient")
            if ok then
                obj.enable_profile()
            end
        end
    },
    {
        type = PROPERTY.LOAD_FUNC,
        fn = function()
            -- have to load first for rest of keymap
            vim.g.mapleader = ' '
        end
    },
}
