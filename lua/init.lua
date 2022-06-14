-- load config files
--
--print(require("core.utils").search_configs)

--local file_list = require("core.utils").search_configs("configs", "init.lua")
local config_list = api_o_utils.search_configs("configs", {["init.lua"]=1})
-- local file_list = api_o_utils.search_configs("configs", {["init.lua"]=1})

-- require('packer').startup(function(use)
--     use 'wbthomason/packer.nvim'
-- end)

-- generate config list
for _, file_config in pairs(config_list) do
    local fn_list = require(file_config)

    for _, fn in pairs(fn_list) do
        api_f_parser(fn)
    end
end

-- load list
api_o_config.plugin.load()
api_o_config.source_plugin.load()
