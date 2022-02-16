local coc_keymapping = {}

local coc_translate = function ()
    local opts =  {
    }

	vim.api.nvim_set_keymap('n', '<Leader>tt', '<Plug>(coc-translator-p)', opts)
	vim.api.nvim_set_keymap('v', '<Leader>tt', '<Plug>(coc-translator-pv)', opts)
	vim.api.nvim_set_keymap('n', '<Leader>te', '<Plug>(coc-translator-e)', opts)
	vim.api.nvim_set_keymap('v', '<Leader>te', '<Plug>(coc-translator-ev)', opts)
	vim.api.nvim_set_keymap('n', '<Leader>tr', '<Plug>(coc-translator-r)', opts)
	vim.api.nvim_set_keymap('v', '<Leader>tr', '<Plug>(coc-translator-rv)', opts)

    vim.api.nvim_set_keymap('n', '<Leader>xx', '<cmd>CocList diagnostics<CR>', {silent = true})

    vim.api.nvim_set_keymap('n', '<M-x>', '<cmd>CocList vimcommands<CR>', {silent = true})

end

coc_keymapping.load = function ()
    coc_translate();
end

return coc_keymapping
