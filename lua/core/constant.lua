--[[
--    This file provide constant list for some requirements
--]]

local const = require("core.utils").const

-- For definding the property of a file in plugins folder
-- local PROPERTY = {
local PROPERTY = const({
    LOAD_FUNC = "LOAD_FUNC",
    VIM_CONFIG = "VIM_CONFIG",
    GEN_KEYMAP = "GEN_KEYMAP",
    PLUGIN_CONFIG = "PLUGIN_CONFIG",
    PLUGIN_KEYBINDINGS = "PLUGIN_KEYBINDINGS",
    LAZYLOAD_PLUGIN_KEYBINDINGS = "LAZYLOAD_PLUGIN_KEYBINDINGS",
    GROUP_BINDING = "GROUP_BINDING",
    LOAD_EVENT = "LOAD_EVENT",
    DEPENDENCY = "DEPENDENCY",
    AUGROUP = "AUGROUP",
    AUTOCMD = "AUTOCMD",
    SOURCE_PLUGIN = "SOURCE_PLUGIN",
    MASK = "MASK",
})

return {
    PROPERTY = PROPERTY,
}
