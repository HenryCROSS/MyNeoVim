local toggleterm_settings = require('toggleterm')

toggleterm_settings.setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    start_in_insert = true,
    open_mapping = nil,
    insert_mappings = false,
    direction = 'horizontal',
    shell = '/bin/zsh',
    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
}

vim.api.nvim_set_keymap('n', '<leader>ot', "<cmd>ToggleTerm<cr>", {})

function _G.set_terminal_keymaps()
    local opts = { noremap = true, buffer = 0 }
    api_o_keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    api_o_keymap.set({'n', 't'}, '<C-q>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
    api_o_keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    api_o_keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    api_o_keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    api_o_keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end
