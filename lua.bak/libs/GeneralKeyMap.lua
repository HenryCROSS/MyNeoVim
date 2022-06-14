-- It store a list of keymapping
local M = {}
local _, whichkey = pcall(require, "which-key")

local scheme = {
    mode = nil,
    lhs = nil,
    rhs = nil,
    desc = nil,
    opts = {
        nowait = false,
        silent = true,
        expr = false,
        noremap = true,
        unique = false,
    }
}

local config_list = {}

function M:new(obj)
    local o = obj or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function M:load()
    local _, _ = xpcall(function()
        for _, info in pairs(config_list) do
            if whichkey ~= nil then
                whichkey.register({
                    [info.lhs] = { info.rhs, name = info.desc }
                }, {
                    mode = info.mode,
                    silent = info.opts.silent,
                    noremap = info.opts.noremap,
                    nowait = info.opts.nowait
                })
            else
                vim.api.nvim_set_keymap(info.mode, info.lhs, info.rhs, info.opts)
                -- try to change to vim.map.set later
            end
        end
    end, debug.traceback)
end

-- TODO: return a list of lhs
-- not sure what to do haha
function M:get_lhs_list()
    local lhs_list = {}

    return lhs_list
end

function M:append_config(mode, lhs, rhs, opts, desc)
    local setting = scheme
    setting.mode = mode
    setting.lhs = lhs
    setting.rhs = rhs
    setting.opts = opts
    setting.desc = desc
    table.insert(config_list, setting)
end

return M
