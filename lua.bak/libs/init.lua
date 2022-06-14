local M = {}
function M.plugins_load(loading_list)
    for _, v in ipairs(loading_list) do
        local ok, _ = xpcall(function()
                require(v).load()
            end,
            debug.traceback
        )
        if not ok then
            builtin_lib.log.LogMsg(builtin_lib.log.LEVELS[4], v, "The builtin lib is not loaded")
        end
    end
end

local libs = {
    "libs.makeScratch"
}

-- require("libs.makeScratch")

M.plugins_load(libs)
