local M = builtin_Class.GenPluginConfig:new(nil)

M:set_name('luochen1990/rainbow')

local config = function()
    vim.g.rainbow_active = 1
end

M:append_fn(config)

return M
