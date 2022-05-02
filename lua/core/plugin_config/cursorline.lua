local M = builtin_Class.GenPluginConfig:new(nil)

M:set_name("yamatsum/nvim-cursorline")


local config = function()
    vim.g.cursorline_timeout = 1
end

M:append_fn(config)

return M
