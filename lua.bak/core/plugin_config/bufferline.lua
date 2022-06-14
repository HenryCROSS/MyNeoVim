local M = builtin_Class.GenPluginConfig:new(nil)
local bufferline_settings = M:require("bufferline")
-- local config = {}

M.name = "akinsho/bufferline.nvim"
M:set_name("akinsho/bufferline.nvim")

local config = function()
    bufferline_settings.setup {
        options = {
            offsets = {
                -- {
                --     filetype = "NvimTree",
                --     text = "File Explorer",
                --     highlight = "Directory",
                --     text_align = "left"
                -- },
                -- {
                --     filetype = "Outline",
                --     text = "Lsp Tags",
                --     text_align = "right"
                -- }
            },
            -- numbers = function(opts)
            --     return string.format('%s·%s', opts.raise(opts.id),
            --     opts.lower(opts.ordinal))
            -- end,
            diagnostics = 'nvim_lsp',
            indicator_icon = '▎',
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            separator_style = "thick",
            enforce_regular_tabs = true,
        }
    }


    -- move to the next tag
    local opts = {noremap = true, silent = true, nowait = true}
    vim.api.nvim_set_keymap('n', '<C-n>', ':BufferLineCycleNext<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-p>', ':BufferLineCyclePrev<CR>', opts)
    -- move current tag to next pos
    vim.api.nvim_set_keymap('n', '<C-c>n', ':BufferLineMoveNext<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-c>p', ':BufferLineMovePrev<CR>', opts)
    -- remove buffer
    -- vim.api.nvim_set_keymap('n', '<C-x>', ':BufferLinePickClose<CR>', opts)

end

M:append_fn(config)

return M
