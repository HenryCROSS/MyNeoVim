--[[
	This lib is the log system of our config
]]

-- import components
local LogLevels = require("libs.Lib_Log.logLevel")

local Log = {}

function Log:Init()

end

function Log:LogMsg(level, msg)

end

function Log:EmergencyLog()

end

setmetatable({}, Log)

return Log