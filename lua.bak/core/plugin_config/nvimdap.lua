local M = builtin_Class.GenPluginConfig:new(nil)
-- local nvimdap_settings = require('dap')

M:set_name("mfussenegger/nvim-dap")

local config = function() end

--[[
--  I might neet to take a look at the docs and think about it later
--]]

M:append_fn(config)

return M
