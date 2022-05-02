local M = builtin_Class.GenPluginConfig:new(nil)

local config = function ()
    vim.api.nvim_set_keymap("n", "<leader>ar", ":AsyncRun ", {})
    vim.api.nvim_set_keymap("v", "<leader>ar", ":'<,'>AsyncRun ", {})
    vim.g.asyncrun_rootmarks = {'.git', '.svn', '.root', '.project', '.hg'}
    vim.g.asynctasks_term_pos = 'bottom'
    vim.g.asynctasks_term_rows = 12
    vim.g.asyncrun_open = 12
end

M:set_name("skywind3000/asyncrun.vim")
M:append_fn(config)

return M
