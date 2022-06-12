--[[
--    This file provide constant list for some requirements
--]]

local const = api_utils.const

-- For definding the property of a file in plugins folder
local PROPERTY = const({
    LOAD_FIRST = "LOAD_FIRST",
    VIM_CONFIG = "VIM_CONFIG",
    GEN_KEYMAP = "GEN_KEYMAP",
    PLUGIN_CONFIG = "PLUGIN_CONFIG",
    GROUP_BINDING = "GROUP_BINDING",
    LOAD_EVENT = "LOAD_EVENT",
    DEPENDENCY = "DEPENDENCY",
    HOOKS = "HOOKS",
})

return {
    PROPERTY,
}
