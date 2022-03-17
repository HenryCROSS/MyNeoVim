local M = {}

M.load = function ()
    require('bufdelete').bufdelete(0, true)
    vim.api.nvim_set_keymap("n", "<Leader>bk", "<cmd>Bdelete<CR>", {noremap = true})
end

return M
