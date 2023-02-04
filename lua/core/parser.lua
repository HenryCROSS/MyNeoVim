local const = require("core.utils").const
local api_o_config = require("core.config_list")
local _, packer = pcall(require, "packer")

local function load_func(task)
    if type(task.fn) == "function" then
        task.fn(task.args)
    end
end

local function plugin_manager(mgr)
    if mgr.name == vim.g.plugin_manager then
        load_func(mgr)
    end
end

--[[ load config to the config tree
--   receive a table
--]]
local function vim_config(table)
    table.type = nil
    if (table.version) then
        if vim.fn.has(table.version) == 1 then
            table.version = nil
        else
            return
        end
    end

    for opts, config in pairs(table) do
        for k, v in pairs(config) do
            vim[opts][k] = v
        end
    end
end

local function gen_keymap(src)
    api_o_keymap.register(src)
end

local function plugin_config(table)
    api_o_config.plugin.add(table)
end

local function plugin_keybindings(table)
    api_o_config.plugin_keymap.add(table)
end

local function lazyload_plugin_keybindings(table)
    table.lazyload = true
    api_o_config.plugin_keymap.add(table)
end

local function group_binding(config)
    api_o_config.group.add(config)
end

local function load_event(config)
    api_o_config.event.add(config)
end

local function dependency(config)
    api_o_config.dependency.add(config)
end

local function augroup(config)
    api_o_config.augroup.add(config)
end

local function autocmd(config)
    api_o_config.autocmd.add(config)
end

local function source_plugin(table)
    api_o_config.source_plugin.add(table)
end

local function mask(table)
    api_o_config.mask.add(table)
end

PORPERTIES_LIST = const {
    LOAD_FUNC = load_func,
    VIM_CONFIG = vim_config,
    GEN_KEYMAP = gen_keymap,
    PLUGIN_CONFIG = plugin_config,
    PLUGIN_KEYBINDINGS = plugin_keybindings,
    LAZYLOAD_PLUGIN_KEYBINDINGS = lazyload_plugin_keybindings,
    GROUP_BINDING = group_binding,
    LOAD_EVENT = load_event,
    DEPENDENCY = dependency,
    AUGROUP = augroup,
    AUTOCMD = autocmd,
    SOURCE_PLUGIN = source_plugin,
    MASK = mask,
    PLUGIN_MANAGER = plugin_manager,
}


local function config_parser(o_config)
    -- local PROPERTY = api_o_const.PROPERTY
    local status = xpcall(function()
        -- print("here" .. o_config.type)
        PORPERTIES_LIST[o_config.type](o_config)
    end, debug.traceback)
end

return config_parser
