local M = {}

M.load = function ()
    vim.api.nvim_set_keymap("n", "<leader>rm", ":AsyncRun ", {})
    vim.api.nvim_set_keymap("v", "<leader>rm", ":'<,'>AsyncRun ", {})
    vim.g.asyncrun_open = 8
end

return M
