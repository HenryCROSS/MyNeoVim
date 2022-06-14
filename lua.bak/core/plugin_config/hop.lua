local M = builtin_Class.GenPluginConfig:new(nil)
local hop_settings = require('hop')

M:set_name("phaazon/hop.nvim")

local config = function()
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

    vim.api.nvim_set_keymap('n', '<Leader>j', ':HopWord<CR>', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>jl', ':HopLine<CR>', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>jo', ':HopChar1<CR>', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>jt', ':HopChar2<CR>', {})
end

M:append_fn(config)

return M
