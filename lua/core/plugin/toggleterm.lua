local toggleterm = {}
local toggleterm_settings = require('toggleterm')
local config = {}

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    local opts = {}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-x>', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
end


toggleterm.load = function()
    toggleterm_settings.setup {
        open_mapping = '<Leader>t',
        insert_mappings = false,
        direction = 'float',
        shell = '/bin/zsh',
        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    }
end

return toggleterm
