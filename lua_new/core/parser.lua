local const = api_utils.const

local function load_first(config)
    config()
end

local function vim_config(config)
    
end

local function gen_keymap(config)
    -- for key, value in pairs(config) do
    --     value()
    -- end
    config()
end

local function plugin_config(config)
    
end

local function group_binding(config)
    
end

local function load_event(config)
    
end

local function dependency(config)
    
end

local function hooks(config)
    
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
}

local function config_parser(o_config)
    PORPERTIES_LIST[o_config.type](o_config.config)
end

return config_parser
