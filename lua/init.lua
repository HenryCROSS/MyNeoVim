local core = require("core")
local api_o_utils = core.utils
local api_o_keymap = core.keymap
local api_o_const = core.constant
local api_o_config = core.config
local api_f_parser = core.parser

local config_list = api_o_utils.search_configs("configs", { ["init.lua"] = 1 })

-- generate config list
for _, file_config in pairs(config_list) do
    local fn_list = require(file_config)
    -- TODO: implement hot reloading
    -- start from here?

    if type(fn_list) == "table" then
        for _, fn in pairs(fn_list) do
            api_f_parser(fn)
        end
    end
end

-- generate users' config list
config_list = api_o_utils.search_configs("user_configs", { ["init.lua"] = 1 })

-- generate config list
for _, file_config in pairs(config_list) do
    local fn_list = require(file_config)

    if type(fn_list) == "table" then
        for _, fn in pairs(fn_list) do
            api_f_parser(fn)
        end
    end
end

api_o_keymap.load()
api_o_config.plugin_keymap.loadAll()
-- TODO
-- -- load mask list
api_o_config.dependency.load()
-- -- load mask list
api_o_config.event.load()


-- -- load mask list
api_o_config.mask.load()

-- load plugin list
api_o_config.plugin.load()
-- load source plugin list
api_o_config.source_plugin.load()
-- load autocmd list
api_o_config.autocmd.load()
