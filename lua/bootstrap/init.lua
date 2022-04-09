local M = {}

M.load = function ()
    local _, _ = pcall(require, "impatient")
    -- value.enable_profile()
    -- require("impatient")
    -- require("core.plugin_config.filetype").load()


    vim.cmd ([[
    autocmd InsertLeave * :silent !fcitx5-remote -c 
    autocmd BufCreate *  :silent !fcitx5-remote -c 
    autocmd BufEnter *  :silent !fcitx5-remote -c 
    autocmd BufLeave *  :silent !fcitx5-remote -c
    ]])

end


return M
