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
    -- "packer.lua",
    "gitsigns.lua",
    "hop.lua"
}

local lsp_config_exceptions = utils.ignore_configs{
    "init.lua",
    "lspconfig_coq.lua",
    "lsp_servers.lua"
}

M.load = function ()

    -- require("core.theme").load()
    -- xpcall(function ()
    --     require("core.theme").load()
    -- end, debug.traceback)

    -- load keymapping
    require("core.keymapping").load()

    -- utils.load_configs(utils.search_configs("plugin_config", plugin_config_exceptions))
    -- utils.load_configs(utils.search_configs("lsp_config", lsp_config_exceptions))

    -- load the general settings
    require("core.nvim_config.settings").load_options()

    -- vim.cmd([[
    --   augroup packer_user_config
    --     autocmd!
    --     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    --   augroup end
    -- ]])

    utils.load_packer_configs(require("core.plugins"))
    vim.g.rainbow_active = 1

end

return M
