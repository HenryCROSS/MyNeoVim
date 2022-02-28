local M = {}
local utils = require("core.utils").util_plugin()
-- local plugin_config_list = require("core.plugin_config")
-- local lsp_config_list = require("core.lsp_config")
local plugin_config_exceptions = utils.ignore_configs{
    "init.lua",
    (function ()
        if vim.loop.os_uname().sysname == "Windows_NT" then
            return "toggleterm.lua"
        end
    end)(),
}

local lsp_config_exceptions = utils.ignore_configs{
    "init.lua",
    "lspconfig_coq.lua",
    "lsp_servers.lua"
}

M.load = function ()
    -- require("core.theme").load()
    local _, v =pcall(require, "core.theme")
    v.load()

    -- load keymapping
    require("core.keymapping").load()

    utils.load_configs(utils.search_configs("plugin_config", plugin_config_exceptions))
    utils.load_configs(utils.search_configs("lsp_config", lsp_config_exceptions))
    utils.packer_install(require("core.plugins"))

    -- load the general settings
    require("core.nvim_config.settings").load_options()
end

return M
