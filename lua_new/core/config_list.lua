--[[
-- stores all the final config before it is loaded by the packer
--
-- This file will not be exposed from api folder
--]]

local plugin_list = {}
local group_list = {}
local config_list = {}

local function get_plugin_list()
    return plugin_list
end

local function get_group_list()
    return group_list
end

local function get_config_list()
    return config_list
end


return {
    plugin = {
        get_plugin_list
    },
    group = {
        get_group_list
    },
    config = {
        get_config_list
    }
}
