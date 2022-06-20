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
local event_list = {}
local dependency_list = {}
local plugin_keymap_list = {}

local function parse_to_plugin_table(src)
    return {
        src.name,
        disable = src.disable, -- Mark a plugin as inactive
        as = src.as, -- Specifies an alias under which to install the plugin
        installer = src.installer, -- Specifies custom installer. See "custom installers" below.
        updater = src.update, -- Specifies custom updater. See "custom installers" below.
        after = src.after, -- Specifies plugins to load before this plugin. See "sequencing" below
        rtp = src.rtp, -- Specifies a subdirectory of the plugin to add to runtimepath.
        opt = src.opt, -- Manually marks a plugin as optional.
        branch = src.branch, -- Specifies a git branch to use
        tag = src.tag, -- Specifies a git tag to use. Supports '*' for "latest tag"
        commit = src.commit, -- Specifies a git commit to use
        lock = src.lock, -- Skip updating this plugin in updates/syncs. Still cleans.
        run = src.run, -- Post-update/install hook. See "update/install hooks".
        requires = src.requires, -- Specifies plugin dependencies. See "dependencies".
        rocks = src.rocks, -- Specifies Luarocks dependencies for the plugin
        config = src.config, -- Specifies code to run after this plugin is loaded.
        -- The setup key implies opt = true
        setup = src.setup, -- Specifies code to run before this plugin is loaded.
        -- The following keys all imply lazy-loading and imply opt = true
        cmd = src.cmd, -- Specifies commands which load this plugin. Can be an autocmd pattern.
        ft = src.ft, -- Specifies filetypes which load this plugin.
        keys = src.keys, -- Specifies maps which load this plugin. See "Keybindings".
        event = src.event, -- Specifies autocommand events which load this plugin.
        fn = src.fn, -- Specifies functions which load this plugin.
        cond = src.cond, -- Specifies a conditional test to load this plugin
        module = src.module, -- Specifies Lua module names for require. When requiring a string which starts
        -- with one of these module names, the plugin will be loaded.
        module_pattern = src.module_pattern
    }
end

local function get_plugin_list()
    return plugin_list
end

local function add_plugin_list(src)
    plugin_list[src.name] = parse_to_plugin_table(src)
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

local function get_event_list()
    return event_list
end

local function add_event_list(src)
    if type(src.plugins) == table then
        event_list[src.event].plugins = api_o_utils.table_insert_as_key(event_list[src.event].plugins, src.plugins)
    end

    if type(src.groups) == table then
        event_list[src.event].groups = api_o_utils.table_insert_as_key(event_list[src.event].groups, src.groups)
    end
end

--[[
    src = {
        plugins = {
            "id" = "id",
            "xx" = "xx" ...
        },
        groups = {},
    }
]]
local function rm_event_list(src)
    if type(src.plugins) == "table" then
        for _, value in pairs(src.plugins) do
            event_list.plugins[value] = nil
        end
    end

    if type(src.groups) == "table" then
        for _, value in pairs(src.groups) do
            event_list.groups[value] = nil
        end
    end
end

-- working on it
local function load_event_list()
    local status_ok, _ = xpcall(function()
        for event, objs in pairs(event_list) do
            for _, plugin in pairs(objs.plugins) do
                plugin_list[plugin].event = event
            end

            for _, group in pairs(objs.groups) do
                for _, plugin in pairs(get_group(group)) do
                    plugin_list[plugin].event = event
                end
            end
        end

    end, debug.traceback)
    if not status_ok then print("ERROR") end
end

--TODO
local function get_plugin_keymap_list()
    return plugin_keymap_list
end

local function get_plugin_keymap(name)
    return plugin_keymap_list[name]
end

--TODO
local function add_plugin_keymap_list(src)
    plugin_keymap_list[src.mask_type] = api_o_utils.table_insert(plugin_keymap_list[src.mask_type], src.config)
end

--TODO
local function rm_plugin_keymap_list(name)
    plugin_keymap_list[name] = nil
end

--TODO
local function load_plugin_keymap_list()
    local status_ok, _ = xpcall(function()
        for plugin, keymaps in pairs(plugin_keymap_list) do

        end
    end, debug.traceback)
    if not status_ok then print("ERROR") end
end

--TODO
local function get_dependency_list()
    return dependency_list
end

--TODO
local function add_dependency_list(src)
    dependency_list[src.mask_type] = api_o_utils.table_insert(dependency_list[src.mask_type], src.config)
end

--TODO
local function rm_dependency_list(name)
    mask_list[name] = nil
end

--TODO
local function load_dependency_list()
    local status_ok, _ = xpcall(function()
    end, debug.traceback)
    if not status_ok then print("ERROR") end
end

return {
    parse_to_plugin_table = parse_to_plugin_table,
    plugin = {
        get = get_plugin_list,
        add = add_plugin_list,
        rm = rm_plugin_list,
        load = load_plugin_list,
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
    },
    event = {
        get = get_event_list,
        add = add_event_list,
        rm = rm_event_list,
        --TODO
        load = load_event_list
    },
    --TODO
    dependency = {
        get = get_dependency_list,
        add = add_dependency_list,
        rm = rm_dependency_list,
        load = load_dependency_list
    },
    --TODO
    plugin_keymap = {
        getOne = get_plugin_keymap,
        getAll = get_plugin_keymap_list,
        add = add_plugin_keymap_list,
        rm = rm_plugin_keymap_list,
        load = load_plugin_keymap_list
    }

}
