local M = {}
local utils = require("core.utils").util_plugin()
local plugin_config_list = require("core.plugin_config")
local lsp_config_list = require("core.lsp_config")

M.load = function ()
    require("core.theme").load()
    -- load keymapping
    require("core.keymapping").load()

    utils.plugins_load(plugin_config_list)
    utils.plugins_load(lsp_config_list)
    utils.packer_install(require("core.plugins"))

    -- load the general settings
    require("core.nvim_config.settings").load_options()
end

return M
