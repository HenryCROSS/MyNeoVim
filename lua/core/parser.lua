local const = require("core.utils").const

local function load_first(config)
end

--[[ load config to the config tree
--   receive a table
--]]
local function vim_config(table)
    local config = table.config
    if (config.version) then
        if vim.fn.has(config.version) == 1 then
            config.version = nil
        else
            return
        end
    end

    for k, v in pairs(config) do
        vim.opt[k] = v
    end
end

local function gen_keymap(table)
    table.config()
end

local function plugin_config(table)
    api_o_config.plugin.add(table)
end

local function group_binding(config)

end

local function load_event(config)

end

local function dependency(config)

end

local function hooks(config)

end

local function source_plugin(table)
    api_o_config.source_plugin.add(table)
end

local function mask(table)
    -- TODO: disable groups or configs
end

PORPERTIES_LIST = const {
    LOAD_FIRST = load_first,
    VIM_CONFIG = vim_config,
    GEN_KEYMAP = gen_keymap,
    PLUGIN_CONFIG = plugin_config,
    GROUP_BINDING = group_binding,
    LOAD_EVENT = load_event,
    DEPENDENCY = dependency,
    HOOKS = hooks,
    SOURCE_PLUGIN = source_plugin,
    MASK = mask,
}

     
local function config_parser(o_config)
    -- local PROPERTY = api_o_const.PROPERTY
    local status = xpcall(function ()
        -- print("here" .. o_config.type)
        PORPERTIES_LIST[o_config.type](o_config)
    end , debug.traceback)
end

return config_parser
