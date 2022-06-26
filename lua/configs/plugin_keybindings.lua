local PROPERTY = api_o_const.PROPERTY
local opts = { noremap = true, silent = true }

return {
    {
        type = PROPERTY.PLUGIN_KEYBINDINGS,
        name = "ziontee113/icon-picker.nvim",
        lazyLoading = false,
        config = api_o_keymap.lzToTbl {
            { "n", "<Leader><Leader>pi", "<cmd>PickIcons<cr>", opts },
            { "n", "<Leader><Leader>pe", "<cmd>PickEmoji<cr>", opts },
            { "n", "<Leader><Leader>pn", "<cmd>PickNerd<cr>", opts },
            { "n", "<Leader><Leader>ps", "<cmd>PickSymbol<cr>", opts },
            { "n", "<Leader><Leader>pf", "<cmd>PickAltFont<cr>", opts },
            { "n", "<Leader><Leader>pz", "<cmd>PickAltFontAndSymbols<cr>", opts },
            { "i", "<C-i>", "<cmd>PickIconsInsert<cr>", opts },
            { "i", "<A-i>", "<cmd>PickAltFontAndSymbolsInsert<cr>", opts },
        }
    },
    {
        type = PROPERTY.PLUGIN_KEYBINDINGS,
        name = "rmagatti/session-lens",
        lazyLoading = false,
        config = api_o_keymap.lzToTbl {
            { 'n', '<Leader>sl', '<cmd>SearchSession<cr>', { desc = "List Sessions" } }
        }
    },
    {
        type = PROPERTY.PLUGIN_KEYBINDINGS,
        name = "https://gitlab.com/yorickpeterse/nvim-window.git",
        lazyLoading = false,
        config = api_o_keymap.lzToTbl {
            { 'n', '<Leader>wg', ':lua require(\'nvim-window\').pick()<CR>',
                { desc = "Jump to the window", noremap = true, silent = true } }
        }
    },
}
