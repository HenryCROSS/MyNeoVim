-- api_o_keymap.set();
-- local function set_keymap (modes, lhs, rhs, opts)
local PROPERTY = api_o_const.PROPERTY
local set = api_o_keymap.set
local mask = api_o_keymap.mask
local opts = {
    noremap = true
}

return {
    {
        type = PROPERTY.GEN_KEYMAP,
        config = function()
            vim.g.mapleader = ' '
            --
            -- esc keymapping
            set('n', 'j', "gj", mask(opts, {}))
            set('n', 'k', "gk", mask(opts, {}))

            -- screen operations
            -- switch screen
            set('n', '<Leader>wh', '<C-w>h', mask(opts, {desc = "go left window"}))
            set('n', '<Leader>wl', '<C-w>l', mask(opts, {desc = "go down window"}))
            set('n', '<Leader>wj', '<C-w>j', mask(opts, {desc = "go up window"}))
            set('n', '<Leader>wk', '<C-w>k', mask(opts, {desc = "go right window"}))
            set('n', '<Leader>wf', '<C-w><C-w>', mask(opts, {desc = "go prev window"}))

            -- split screen
            set('n', '<Leader>ws', ':sp<CR>', mask(opts, {desc = "horizontal split"}))
            set('n', '<Leader>wv', ':vsp<CR>', mask(opts, {desc = "vertical split"}))
            set('n', '<Leader>wq', '<c-w>q', mask(opts, {desc = "quit screen"}))

            -- screen reposition
            set('n', '<Leader>wL', '<c-w>L', mask(opts, {desc = "move window left"}))
            set('n', '<Leader>wH', '<c-w>H', mask(opts, {desc = "move window right"}))
            set('n', '<Leader>wJ', '<c-w>J', mask(opts, {desc = "move window down"}))
            set('n', '<Leader>wK', '<c-w>K', mask(opts, {desc = "move window up"}))
            set('n', '<Leader>wx', '<c-w>x', mask(opts, {desc = "swtich window"}))

            -- scrolling
            set('n', '<C-j>', '<c-e>', mask(opts, {desc = "scroll down"}))
            set('n', '<C-k>', '<c-y>', mask(opts, {desc = "scroll up"}))

            -- resize
            set('n', '<S-M-h>', '<c-w><', mask(opts, {desc = "resize left"}))
            set('n', '<S-M-j>', '<c-w>+', mask(opts, {desc = "resize up"}))
            set('n', '<S-M-k>', '<c-w>-', mask(opts, {desc = "resize down"}))
            set('n', '<S-M-l>', '<c-w>>', mask(opts, {desc = "resize right"}))

            -- tab operations
            set('n', '<Leader>tn', '<cmd>tabnew<cr>', mask(opts, {desc = "create tab"}))
            set('n', '<Leader>tq', '<cmd>tabclose<cr>', mask(opts, {desc = "quit tab"}))
            set('n', '<M-n>', '<cmd>tabnext<cr>', mask(opts, {desc = "next tab"}))
            set('n', '<M-p>', '<cmd>tabprevious<cr>', mask(opts, {desc = "prev tab"}))
        end
    }
}
