--[[
	This lib is the log system of our config
]]

local M = {}
-- import components
M.LEVELS = require("libs.Lib_Log.logLevel")

M.LogMsg = function(level, file, msg)
	print("[", level, "] File: ", file, " Msg: ", msg)
end

return M
