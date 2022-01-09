local hop = {}
local hop_settings = require('hop')

hop.load = function()
    hop_settings.setup()
    vim.api.nvim_set_keymap('n', 'f',
                            "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
                            {})
    vim.api.nvim_set_keymap('n', 'F',
                            "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
                            {})
    vim.api.nvim_set_keymap('o', 'f',
                            "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
                            {})
    vim.api.nvim_set_keymap('o', 'F',
                            "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
                            {})
    vim.api.nvim_set_keymap('', 't',
                            "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
                            {})
    vim.api.nvim_set_keymap('', 'T',
                            "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
                            {})

    vim.api.nvim_set_keymap('n', '<Leader>hw', ':HopWord<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>hl', ':HopLine<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>hco', ':HopChar1<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>hct', ':HopChar2<CR>', {})
end

return hop
