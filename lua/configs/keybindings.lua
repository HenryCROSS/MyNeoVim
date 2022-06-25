-- api_o_keymap.set();
-- local function set_keymap (modes, lhs, rhs, opts)
local PROPERTY = api_o_const.PROPERTY
local set = api_o_keymap.set
local mask = api_o_keymap.mask
local opts = {
    noremap = true
}
local keymaps = {
    -- esc keymapping
    { { 'n', 'v' }, 'j', "gj", mask(opts, {}) },
    { { 'n', 'v' }, 'k', "gk", mask(opts, {}) },
    { { 'n', 'v' }, '^', "g^", mask(opts, {}) },
    { { 'n', 'v' }, '$', "g$", mask(opts, {}) },

    -- screen operations
    -- switch screen
    { 'n', '<Leader>wh', '<C-w>h', mask(opts, { desc = "go left window" }) },
    { 'n', '<Leader>wl', '<C-w>l', mask(opts, { desc = "go down window" }) },
    { 'n', '<Leader>wj', '<C-w>j', mask(opts, { desc = "go up window" }) },
    { 'n', '<Leader>wk', '<C-w>k', mask(opts, { desc = "go right window" }) },
    { 'n', '<Leader>wf', '<C-w><C-w>', mask(opts, { desc = "go prev window" }) },

    -- split screen
    { 'n', '<Leader>ws', ':sp<CR>', mask(opts, { desc = "horizontal split" }) },
    { 'n', '<Leader>wv', ':vsp<CR>', mask(opts, { desc = "vertical split" }) },
    { 'n', '<Leader>wq', '<c-w>q', mask(opts, { desc = "quit screen" }) },

    -- screen reposition
    { 'n', '<Leader>wL', '<c-w>L', mask(opts, { desc = "move window left" }) },
    { 'n', '<Leader>wH', '<c-w>H', mask(opts, { desc = "move window right" }) },
    { 'n', '<Leader>wJ', '<c-w>J', mask(opts, { desc = "move window down" }) },
    { 'n', '<Leader>wK', '<c-w>K', mask(opts, { desc = "move window up" }) },
    { 'n', '<Leader>wx', '<c-w>x', mask(opts, { desc = "swtich window" }) },

    -- scrolling
    { 'n', '<C-j>', '<c-e>', mask(opts, { desc = "scroll down" }) },
    { 'n', '<C-k>', '<c-y>', mask(opts, { desc = "scroll up" }) },

    -- resize
    { { 'n', 't' }, '<S-M-h>', '<c-w><', mask(opts, { desc = "resize left" }) },
    { { 'n', 't' }, '<S-M-j>', '<c-w>+', mask(opts, { desc = "resize up" }) },
    { { 'n', 't' }, '<S-M-k>', '<c-w>-', mask(opts, { desc = "resize down" }) },
    { { 'n', 't' }, '<S-M-l>', '<c-w>>', mask(opts, { desc = "resize right" }) },

    -- tab operations
    { 'n', '<Leader>tn', '<cmd>tabnew<cr>', mask(opts, { desc = "create tab" }) },
    { 'n', '<Leader>tq', '<cmd>tabclose<cr>', mask(opts, { desc = "quit tab" }) },
    { 'n', '<Leader>to', '<cmd>tabonly<cr>', mask(opts, { desc = "quit other tab" }) },
    { 'n', '<M-n>', '<cmd>tabnext<cr>', mask(opts, { desc = "next tab" }) },
    { 'n', '<M-p>', '<cmd>tabprevious<cr>', mask(opts, { desc = "prev tab" }) },

    -- buffer operations
    -- {'n', '<Leader>tn', '<cmd>tabnew<cr>', mask(opts, {desc = "create tab"})},
    -- {'n', '<Leader>tq', '<cmd>tabclose<cr>', mask(opts, {desc = "quit tab"})},
    -- {'n', '<Leader>to', '<cmd>tabonly<cr>', mask(opts, {desc = "quit other tab"})},
    { 'n', '<Leader>bc', '<cmd>enew<cr>', mask(opts, { desc = "Create Buffer" }) },
    { 'n', '<C-n>', '<cmd>bn<cr>', mask(opts, { desc = "Next Buffer" }) },
    { 'n', '<C-p>', '<cmd>bp<cr>', mask(opts, { desc = "Prev Buffer" }) },

    -- set other keybindings
    { 'n', '<tab>', 'za', mask(opts, { desc = "Toggle fold" }) },
    { 'n', '<S-tab>', 'zA', mask(opts, { desc = "Toggle all fold" }) },
}

local convert_list = function (lz)
    local result = {}
    for _, value in ipairs(lz) do
        table.insert(result, {
            modes = value[1],
            lhs = value[2],
            rhs = value[3],
            opts = value[4]
        })
    end

    return result
end

return {
    {
        type = PROPERTY.GEN_KEYMAP,
        name = "General_keymap",
        config = api_o_keymap.lzToTbl(keymaps)
    }
}
