local plugin_settings = {}

function plugin_settings.load()
    -- dracula
    vim.cmd [[colorscheme kanagawa]]
    --vim.cmd [[colorscheme strawberry-light]]
    --

    require("core.lsp.nvimlspinstaller").load()
    -- require("core.lsp.lspconfig").load()
    require("core.lsp.lspconfig_cmp").load()
    require("core.lsp.lsp_signature").load()
    require("core.lsp.fidget").load()
    require("core.lsp.goto_preview").load()
    require("core.plugin.treesitter").load()
    require("core.plugin.dashboard").load()
    require("core.plugin.nvimtree").load()
    require("core.plugin.whichkey").load()
    require("core.plugin.bufferline").load()
    require("core.plugin.gitsigns").load()
    require("core.plugin.toggleterm").load()
    require("core.plugin.lualine").load()
    require("core.plugin.comment").load()
    -- require("core.plugin.indentguides").load()
    require("core.plugin.symbolsoutline").load()
    require("core.plugin.autosave").load()
    -- require("core.plugin.cursorline").load()
    require("core.plugin.trouble").load()
    require("core.plugin.nvimgps").load()
    require("core.plugin.nvimcolorizer").load()
    require("core.plugin.wilder").load()
    require("core.plugin.hop").load()
    require("core.plugin.nullls").load()
    require("core.plugin.autopairs").load()
    -- require("core.plugin.smartpairs").load()
    require("core.plugin.mini").load()
    require("core.plugin.telescope").load()
    require("core.plugin.markdownpreview").load()
    require("core.plugin.stabilize").load()
    require("core.plugin.vimtranslator").load()
    -- require("core.lsp.cocnvim").load()
    require("core.plugin.venn").load()
    require("core.plugin.neorg").load()
    require("core.plugin.rainbow").load()
end

return plugin_settings
