local M = builtin_Class.GenPluginConfig:new(nil)
M:set_name("skywind3000/asynctasks.vim")

local config = function ()
    vim.g.asynctasks_extra_config = {
        '~/.config/nvim/global_task/tasks.ini'
    }
end

M:append_fn(config)

return M
