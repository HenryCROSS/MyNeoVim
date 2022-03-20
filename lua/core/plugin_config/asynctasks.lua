local M = {}

M.name = "skywind3000/asynctasks.vim"

M.load = function ()
    vim.g.asynctasks_extra_config = {
        '~/.config/nvim/global_task/tasks.ini'
    }
end

return M
