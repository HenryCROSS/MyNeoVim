local keymapping = {}

keymapping.load = function ()
	vim.g.mapleader = ','
    local opts =  {
        noremap = true
    }

    -- esc keymapping
    vim.api.nvim_set_keymap('i', '<C-x>', "<Esc>", opts)

    -- screen operations
	vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
	vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
	vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
	vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)

    -- screen operations
	vim.api.nvim_set_keymap('n', '<Leader>wh', ':sp<CR>', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wv', ':vsp<CR>', opts)
	vim.api.nvim_set_keymap('n', '<Leader>wq', '<c-w>q', opts)

    -- tab operations
end

return keymapping
