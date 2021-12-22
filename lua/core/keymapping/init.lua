local keymapping = {}

keymapping.load = function ()
	vim.g.mapleader = ','
    local opts =  {
        noremap = true
    }

    -- screen operations
	vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
	vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
	vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
	vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)

    -- buffer operations
    -- tab operations
end

return keymapping
