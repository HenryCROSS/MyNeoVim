local M = {}
local utils = require("core.utils").util_plugin()
local plugin_config_list = require("core.plugin_config")

M.load = function ()
    -- load keymapping
    require("core.keymapping").load()

    utils.plugins_load(plugin_config_list)
    utils.packer_install(require("core.plugins"))
    -- require('core.utils.plugin_loader').load(require("core.plugin_config.plugins"))
    -- require("core.plugin_config.plugin_settings").load()
    require("core.lsp").load()

    -- load the general settings
    require("core.nvim_config.settings").load_options()
end

return M
