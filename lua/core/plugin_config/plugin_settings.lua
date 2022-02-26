local logger = require("libs.Lib_Log")
local plugin_settings = {}
local loading_list = {
    "core.lsp.nvimlspinstaller",
    "core.lsp.lspconfig_cmp",
    "core.lsp.lsp_signature",
    "core.lsp.fidget",
    "core.lsp.goto_preview",
    "core.plugin_config.treesitter",
    "core.plugin_config.dashboard",
    "core.plugin_config.nvimtree",
    "core.plugin_config.whichkey",
    "core.plugin_config.bufferline",
    "core.plugin_config.gitsigns",
    -- "core.lsp.lspconfig",
    "core.plugin_config.toggleterm",
    "core.plugin_config.lualine",
    "core.plugin_config.comment",
    -- "core.plugin_config.indentguides",
    "core.plugin_config.symbolsoutline",
    "core.plugin_config.autosave",
    -- "core.plugin_config.cursorline",
    "core.plugin_config.trouble",
    "core.plugin_config.nvimgps",
    "core.plugin_config.nvimcolorizer",
    "core.plugin_config.wilder",
    "core.plugin_config.hop",
    "core.plugin_config.nullls",
    "core.plugin_config.autopairs",
    -- "core.plugin_config.smartpairs",
    "core.plugin_config.mini",
    "core.plugin_config.telescope",
    "core.plugin_config.markdownpreview",
    "core.plugin_config.stabilize",
    "core.plugin_config.vimtranslator",
    -- "core.lsp.cocnvim",
    "core.plugin_config.venn",
    "core.plugin_config.neorg",
    "core.plugin_config.rainbow",
}

function plugin_settings.load()
    -- dracula
    vim.cmd [[colorscheme kanagawa]]
    --vim.cmd [[colorscheme strawberry-light]]
    --

    for _,v in ipairs(loading_list) do
        local ok, mod = pcall(require, v)
        if not ok then
            logger.LogMsg(logger.LEVELS[2], v, "The plugin is not loaded")
        else
            mod.load()
        end
    end
end

return plugin_settings
