local M = builtin_Class.GenPluginConfig:new(nil)

M:set_name("weilbith/nvim-code-action-menu")

local config = function()
    vim.g.code_action_menu_show_details = true
    vim.g.code_action_menu_show_diff = true
end

M:append_fn(config)

return M
