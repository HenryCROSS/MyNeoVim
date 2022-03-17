local toggleterm = {}
local toggleterm_settings = require('toggleterm')

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-x>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- toggleterm = { {"n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<cr>", "ntst"}, {"n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<cr>", "ntst"}, {"n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<cr>", "ntst"}, {"n", "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", "ntst"} },


-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

toggleterm.name = "akinsho/nvim-toggleterm.lua"

toggleterm.load = function()
    toggleterm_settings.setup {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = nil,
        insert_mappings = false,
        direction = 'horizontal',
        shell = '/bin/zsh',
        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    }

    vim.api.nvim_set_keymap('n', '<leader>ot', "<cmd>ToggleTerm<cr>", {})
end

return toggleterm
