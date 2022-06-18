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

    if type(fn_list) == "table" then
        for _, fn in pairs(fn_list) do
            api_f_parser(fn)
        end
    end
end

-- generate other users' config list
-- TODO

-- load mask list
-- TODO
api_o_config.mask.load()

-- load plugin list
api_o_config.plugin.load()
-- load source plugin list
api_o_config.source_plugin.load()
-- load autocmd list
api_o_config.autocmd.load()

