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
local augroup_list = {}
local autocmd_list = {}
local mask_list = {}

local function get_plugin_list()
    return plugin_list
end

local function add_plugin_list(src)
    plugin_list[src.name] = {
        src.name,
        config = src.config,
        branch = src.branch,
        run = src.run,
        cmd = src.cmd,
        requires = src.requires,
    }
end

--[[
    args: string/list of strings
]]
local function rm_plugin_list(obj)
    local type = type(obj)
    if type == "table" then
        for _, src in pairs(obj) do
            plugin_list[src] = nil
        end
    elseif type == "string" then
        plugin_list[obj] = nil
    end
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

local function get_group(name)
    return group_list[name]
end

local function add_group_list(src)
    group_list[src.name] = src.config
end

local function rm_group_list(src)
    group_list[src.name] = nil
end

local function get_config_list()
    return config_list
end

local function get_source_plugin_list()
    return source_plugin_list
end

local function add_source_plugin_list(src)
    source_plugin_list[src.name] = {
        src.name,
        config = src.config,
        -- branch = table.branch,
        -- run = table.run,
        -- cmd = table.cmd,
        -- requires = table.requires,
    }
end

--[[
    args: string/table of strings
]]
local function rm_source_plugin_list(obj)
    local type = type(obj)
    if type == "table" then
        for _, src in pairs(mask_list) do
            source_plugin_list[src] = nil
        end
    elseif type == "string" then
        source_plugin_list[obj] = nil
    end
end

local function load_source_plugin_list()
    local status_ok, _ = xpcall(function()
        for _, plugin in pairs(source_plugin_list) do
            plugin.config()
        end
    end, debug.traceback)

    if not status_ok then print("Source plugin loading ERROR!!!!!!") end
end

local function get_augroup_list()
    return augroup_list
end

local function add_augroup_list(src)
    augroup_list[src.name] = src.id
end

local function rm_augroup_list(name)
    augroup_list[name] = nil
end

local function get_autocmd_list()
    return autocmd_list
end

local function add_autocmd_list(src)
    autocmd_list[src.name] = src.config
end

local function rm_autocmd_list(name)
    autocmd_list[name] = nil
end

local function load_autocmd_list()
    local status_ok, _ = xpcall(function()
        for _, autocmds in pairs(autocmd_list) do
            for _, value in pairs(autocmds) do
                value()
            end
        end
    end, debug.traceback)

    if not status_ok then print("ERROR") end
end

local function get_mask_list()
    return mask_list
end

local function add_mask_list(src)
    mask_list[src.mask_type] = api_o_utils.table_insert(mask_list[src.mask_type], src.config)
    -- for key, value in pairs(mask_list[src.mask_type]) do
    --     print(key .. " " .. value)
    -- end
end

local function rm_mask_list(name)
    mask_list[name] = nil
end

local function load_mask_list()
    local status_ok, _ = xpcall(function()
        for key, obj in pairs(mask_list) do
            if key == "GROUPS" then
                for _, group_name in pairs(obj) do
                    rm_plugin_list(get_group(group_name))
                end

            elseif key == "PLUGINS" then
                rm_plugin_list(obj)
            end
        end
    end, debug.traceback)
    if not status_ok then print("ERROR") end
end

return {
    plugin = {
        get = get_plugin_list,
        add = add_plugin_list,
        rm = rm_plugin_list,
        load = load_plugin_list
    },
    group = {
        getAll = get_group_list,
        getOne = get_group,
        add = add_group_list,
        rm = rm_group_list,
    },
    config = {
        get = get_config_list
    },
    source_plugin = {
        get = get_source_plugin_list,
        add = add_source_plugin_list,
        rm = rm_source_plugin_list,
        load = load_source_plugin_list
    },
    augroup = {
        get = get_augroup_list,
        add = add_augroup_list,
        rm = rm_augroup_list,
    },
    autocmd = {
        get = get_autocmd_list,
        add = add_autocmd_list,
        rm = rm_autocmd_list,
        load = load_autocmd_list
    },
    mask = {
        get = get_mask_list,
        add = add_mask_list,
        rm = rm_mask_list,
        load = load_mask_list
    }

}
