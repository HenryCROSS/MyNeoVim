local M = builtin_Class.GenPluginConfig:new(nil)

M:set_name("kristijanhusak/vim-carbon-now-sh")

local config = function ()
    -- vim.g.carbon_now_sh_base_url = 'http://localhost:3000'
end

M:append_fn(config)

return M
