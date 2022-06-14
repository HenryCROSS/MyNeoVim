local M = builtin_Class.GenPluginConfig:new(nil)
local colorizer_settings = require('colorizer')

M:set_name("norcalli/nvim-colorizer.lua")

local config = function ()
    colorizer_settings.setup{
        '*'
    }
end

M:append_fn(config)

return M
