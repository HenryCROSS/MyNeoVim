local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "phaazon/hop.nvim",
        config = function()
            require("hop").setup()
            api_o_keymap.set('n', 'f',
                "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
                {})
            api_o_keymap.set('n', 'F',
                "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
                {})
            api_o_keymap.set('o', 'f',
                "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
                {})
            api_o_keymap.set('o', 'F',
                "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
                {})
            api_o_keymap.set('', 't',
                "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
                {})
            api_o_keymap.set('', 'T',
                "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
                {})

            api_o_keymap.set('n', '<Leader>j', '<cmd>HopWord<CR>', {})
        end

    },
}
