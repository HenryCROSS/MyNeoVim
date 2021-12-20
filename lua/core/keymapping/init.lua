local keymapping = {}

keymapping.load = function ()
	vim.g.mapleader = ','

	vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
	vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})
	vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
	vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
end

return keymapping