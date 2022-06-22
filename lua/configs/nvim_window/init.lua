local PROPERTY = api_o_const.PROPERTY
return {
    -- {
    --     type = PROPERTY.SOURCE_PLUGIN,
    --     -- type = PROPERTY.PLUGIN_CONFIG,
    --     name = "yorickpeterse/nvim-window",
    --     config = function()
    --         -- require('configs.nvim_window.nvim-window').setup({
    --         --     -- The characters available for hinting windows.
    --         --     chars = {
    --         --         'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
    --         --         'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    --         --     },

    --         --     -- A group to use for overwriting the Normal highlight group in the floating
    --         --     -- window. This can be used to change the background color.
    --         --     normal_hl = 'Normal',

    --         --     -- The highlight group to apply to the line that contains the hint characters.
    --         --     -- This is used to make them stand out more.
    --         --     hint_hl = 'Bold',

    --         --     -- The border style to use for the floating window.
    --         --     border = 'single'
    --         -- })

    --         api_o_keymap.set('n', '<Leader>wg', ':lua require(\'configs.nvim_window.nvim-window\').pick()<CR>', {desc = "Jump to the window", noremap = true, silent = true})
    --     end

    -- },
    {
        -- type = PROPERTY.SOURCE_PLUGIN,
        type = PROPERTY.PLUGIN_CONFIG,
        name = "https://gitlab.com/yorickpeterse/nvim-window.git",
        config = function()
            vim.cmd [[
                hi BlackOnLightYellow guifg=#000000 guibg=#f2de91
            ]]
            require('nvim-window').setup({
                -- The characters available for hinting windows.
                chars = {
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
                },

                -- -- A group to use for overwriting the Normal highlight group in the floating
                -- -- window. This can be used to change the background color.
                normal_hl = 'NormalFloat',

                -- -- The highlight group to apply to the line that contains the hint characters.
                -- -- This is used to make them stand out more.
                -- hint_hl = 'Bold',

                -- -- The border style to use for the floating window.
                -- border = 'single'
                -- normal_hl = 'BlackOnLightYellow',
                hint_hl = 'Bold',
                border = 'none'

            })

            api_o_keymap.set('n', '<Leader>wg', ':lua require(\'nvim-window\').pick()<CR>',
                { desc = "Jump to the window", noremap = true, silent = true })

        end

    },
}
