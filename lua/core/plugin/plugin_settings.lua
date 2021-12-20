local plugin_settings = {}

function plugin_settings.load()
    -- dracula
    vim.cmd [[colorscheme dracula]]

    require("core.plugin.dashboard").load()
    require("core.plugin.autopairs").load()
    require("core.plugin.nvimtree").load()
    require("core.plugin.whichkey").load()
    require("core.plugin.bufferline").load()
    require("core.plugin.gitsigns").load()
    require("core.plugin.toggleterm").load()
end

return plugin_settings
