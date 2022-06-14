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

local function get_plugin_list()
    return plugin_list
end

local function add_plugin_list(table)
    -- print("<<<<<<<<<<<<<<<<<<<<<<" .. name)
    -- local config = table.config
    plugin_list[table.name] = {
        table.name,
        config = table.config,
        branch = table.branch,
        run = table.run,
        cmd = table.cmd,
        -- config = function ()
        --     if table.config ~= nil then
        --         -- print(table.name .. ">>>")
        --         -- print(table.config)
        --         -- table.config()
        --     end
        -- end
    }

    -- for key, value in pairs(plugin_list[name]) do
    --     print(value)
    -- end
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
    }
}
