--[[
-- This folder is storing the global functions
]]
local M = {}

M.load = function ()
_G.api_fn = {
    -- vim.api.nvim_set_keymap()
    set_gkm = vim.api.nvim_set_keymap,
    -- vim.api.nvim_get_keymap()
    get_gkm = vim.api.nvim_get_keymap,
    -- vim.api.nvim_del_keymap()
    del_gkm = vim.api.nvim_del_keymap,
    -- vim.api.nvim_exec()
    vtl_exec = vim.api.nvim_exec,
}

_G.builtin_lib = {
    log = require('libs.Lib_Log'),
    fio = require('libs.Lib_Fio')
}

end

return M
