--[[
    it stores all the executable plugin config functions,
    and it will be loaded at once
]]
local M = {}

local plugin_fn_list = { }

-- init the plugin settings
function M:new (name)
    plugin_fn_list[name] = plugin_fn_list[name] or {}
end

function M:load(name)
    local ok, _ = xpcall(function ()
        for _, fn in pairs(plugin_fn_list[name]) do
    -- print(name .. " working")
            fn()
        end
    end, debug.traceback)

    if ok then
    else
        print(config.name .. "has some issues...")
    end
end

function M:append_fn(name, fn)
    self:new(name)
    if type(fn) == "function" and fn ~= nil then
        table.insert(plugin_fn_list[name], fn)
    end
end

return M