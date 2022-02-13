local keymapping = {}

keymapping.load = function ()
	vim.g.mapleader = ' '
    local opts =  {
        noremap = true
    }

    -- esc keymapping
    -- vim.api.nvim_set_keymap('i', '<C-x>', "<Esc>", opts)

    -- screen operations
    -- switch screen
	vim.api.nvim_set_keymap('n', '<Leader>wh', '<C-w>h', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wl', '<C-w>l', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wj', '<C-w>j', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wk', '<C-w>k', opts)

    -- split screen
	vim.api.nvim_set_keymap('n', '<Leader>ws', ':sp<CR>', opts)
    vim.api.nvim_set_keymap('n', '<Leader>wv', ':vsp<CR>', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wq', '<c-w>q', opts)

    -- screen reposition
	vim.api.nvim_set_keymap('n', '<Leader>wL', '<c-w>L', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wH', '<c-w>H', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wJ', '<c-w>J', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wK', '<c-w>K', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wx', '<c-w>x', opts)

    -- scrolling
	vim.api.nvim_set_keymap('n', '<C-j>', '<c-e>', opts)
	vim.api.nvim_set_keymap('n', '<C-k>', '<c-y>', opts)

    -- resize
	vim.api.nvim_set_keymap('n', '<S-M-h>', '<c-w><', opts)
	vim.api.nvim_set_keymap('n', '<S-M-j>', '<c-w>+', opts)
	vim.api.nvim_set_keymap('n', '<S-M-k>', '<c-w>-', opts)
	vim.api.nvim_set_keymap('n', '<S-M-l>', '<c-w>>', opts)

    -- tab operations
end

return keymapping
