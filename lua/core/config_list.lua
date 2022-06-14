--[[
-- stores all the final config before it is loaded by the packer
--
-- This file will not be exposed from api folder
--]]

local utils = require("core.utils")
local _, packer = pcall(require, "packer")

local plugin_list = {}
local group_list = {}
local config_list = {}
local source_plugin_list = {}

local function get_plugin_list()
    return plugin_list
end

local function add_plugin_list(table)
    plugin_list[table.name] = {
        table.name,
        config = table.config,
        branch = table.branch,
        run = table.run,
        cmd = table.cmd,
        requires = table.requires,
    }
end

local function rm_plugin_list(name)
    plugin_list[name] = nil
end

local function load_plugin_list()
    local status_ok, _ = xpcall(function()
        packer.startup(function(use)
            -- for _, plugins in ipairs(plugin_arr) do
            for _, plugin in pairs(plugin_list) do
                use(plugin)
            end
            -- end
        end)
    end, debug.traceback)

    if not status_ok then print("ERROR") end
end

local function get_group_list()
    return group_list
end

local function get_config_list()
    return config_list
end

local function get_source_plugin_list()
    return source_plugin_list
end

local function add_source_plugin_list(table)
    source_plugin_list[table.name] = {
        table.name,
        config = table.config,
        -- branch = table.branch,
        -- run = table.run,
        -- cmd = table.cmd,
        -- requires = table.requires,
    }
end

local function rm_source_plugin_list(name)
    source_plugin_list[name] = nil
end

local function load_source_plugin_list()
    local status_ok, _ = xpcall(function()
        for key, plugin in pairs(source_plugin_list) do
            plugin.config()
        end
    end, debug.traceback)

    if not status_ok then print("Source plugin loading ERROR!!!!!!") end
end

return {
    plugin = {
        get = get_plugin_list,
        add = add_plugin_list,
        rm = rm_plugin_list,
        load = load_plugin_list
    },
    group = {
        get = get_group_list
    },
    config = {
        get = get_config_list
    },
    source_plugin = {
        get = get_source_plugin_list,
        add = add_source_plugin_list,
        rm = rm_source_plugin_list,
        load = load_source_plugin_list
    }

}
