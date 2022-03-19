local M = {}

M.load = function ()
    vim.api.nvim_set_keymap("n", "<Leader>bk", "<cmd>Bdelete<CR>", {noremap = true})
end

return M
