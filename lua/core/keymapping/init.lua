local keymapping = {}

keymapping.load = function ()
	vim.g.mapleader = ' '
	local opts =  {
		noremap = true
	}

	-- esc keymapping
	api_fn.set_gkm('n', 'j', "gj", opts)
	api_fn.set_gkm('n', 'k', "gk", opts)

	-- screen operations
	-- switch screen
	api_fn.set_gkm('n', '<Leader>wh', '<C-w>h', opts)
	api_fn.set_gkm('n', '<Leader>wl', '<C-w>l', opts)
	api_fn.set_gkm('n', '<Leader>wj', '<C-w>j', opts)
	api_fn.set_gkm('n', '<Leader>wk', '<C-w>k', opts)
	api_fn.set_gkm('n', '<Leader>wf', '<C-w><C-w>', opts)

	-- split screen
	api_fn.set_gkm('n', '<Leader>ws', ':sp<CR>', opts)
	api_fn.set_gkm('n', '<Leader>wv', ':vsp<CR>', opts)
	api_fn.set_gkm('n', '<Leader>wq', '<c-w>q', opts)

	-- screen reposition
	api_fn.set_gkm('n', '<Leader>wL', '<c-w>L', opts)
	api_fn.set_gkm('n', '<Leader>wH', '<c-w>H', opts)
	api_fn.set_gkm('n', '<Leader>wJ', '<c-w>J', opts)
	api_fn.set_gkm('n', '<Leader>wK', '<c-w>K', opts)
	api_fn.set_gkm('n', '<Leader>wx', '<c-w>x', opts)

	-- scrolling
	api_fn.set_gkm('n', '<C-j>', '<c-e>', opts)
	api_fn.set_gkm('n', '<C-k>', '<c-y>', opts)

	-- resize
	api_fn.set_gkm('n', '<S-M-h>', '<c-w><', opts)
	api_fn.set_gkm('n', '<S-M-j>', '<c-w>+', opts)
	api_fn.set_gkm('n', '<S-M-k>', '<c-w>-', opts)
	api_fn.set_gkm('n', '<S-M-l>', '<c-w>>', opts)

	-- tab operations
	api_fn.set_gkm('n', '<Leader>tn', '<cmd>tabnew<cr>', opts)
	api_fn.set_gkm('n', '<Leader>tq', '<cmd>tabclose<cr>', opts)
	api_fn.set_gkm('n', '<M-n>', '<cmd>tabnext<cr>', opts)
	api_fn.set_gkm('n', '<M-p>', '<cmd>tabprevious<cr>', opts)
end

return keymapping
