local M = {}

M. name = "weilbith/nvim-code-action-menu"

M.load = function()
    vim.g.code_action_menu_show_details = true
    vim.g.code_action_menu_show_diff = true
end

return M
