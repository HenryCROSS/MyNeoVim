local M = { name = "", cfgs = {},
    load = function()

    end
}
local _, notify = pcall(require, "notify")

-- M.config = {
--     name = "Plugin",
--     fn_list = {},
--     fn_sz = 0
--     -- announcement_fn = nil
-- }

-- config.announcement_fn = function ()
--     if notify ~= nil then
--         vim.notify(config.name .. " is loaded!")
--     end
-- end

function M:new(obj, name)
    local o = obj or {}
    o.name = name
    o.cfgs = {}
    setmetatable(o, self)
    self.__index = self -- create __index
    -- self.config = {
    --     name = name,
    --     fn_list = {},
    --     fn_sz = 0,
    -- }
    return o
end

-- function M:set_name(name)
--     config.name = name
-- end

-- function M:get_name()
--     return config.name
-- end

--[[
-- This function will be executed when the plugin config is loaded
]]
-- function M:set_announcement_fn(fn)
--     config.announcement_fn = fn
-- end

-- function M:require(plugin_name)
--     local _, plugin = pcall(require, plugin_name)
--     return plugin
-- end

function M:load()
    -- dev.p(self)
    -- print("==========test================")
    -- for key, value in pairs(api_o_fn_list.get_list()) do
    --     print(key .. ":")
    --     dev.p(value)
    -- end
    local ok, _ = xpcall(function()
        for _, fn in pairs(self.cfgs) do
            fn()
        end
    end, debug.traceback)

    -- if ok then
    --     config.announcement_fn()
    -- else
    --     print(config.name .. "has some issues...")
    -- end
end

function M:append_fn(fn)
    -- fn() -- <-- test
    table.insert(self.cfgs, fn)
end

function M:get_state()
    return self
end

return M
