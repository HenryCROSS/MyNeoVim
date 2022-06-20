--[[ format:
string: modes
string: left-hand
string: right-hand, it could be string or Lua function (>= 0.7)
list:
{
    buffer,
    nowait,
    silent,
    script,
    expr,
    unique,
    desc
}
--]]

vim.data = {
    key = {}
}

local key_list = vim.data.key

local table_concate = require("core.utils").table_concat

local function set_keymap (modes, lhs, rhs, opts)
    vim.keymap.set(modes, lhs, rhs, opts)
end

local function rm_keymap (modes, lhs)
    vim.keymap.del(modes, lhs)
end

local function mask_opts (mask, new_opts)
    return table_concate(mask, new_opts)
end

--[[
    {
        {
            modes,
            lhs,
            rhs,
            opts
        }, ....
    }
]]
local function set_keymap_list(list)
    api_o_utils.table_insert(key_list, list)
end

local function rm_keymap_list (modes, lhs)
    for key, value in pairs(key_list) do
        if value[1] == modes and value[2] == lhs then
            key_list[key] = nil
        end
    end
end

local function load_keymap_list (modes, lhs)
    -- TODO
end

return {
    set = set_keymap,
    set_list = set_keymap_list,
    rm = rm_keymap,
    rm_list = rm_keymap_list,
    mask = mask_opts,
    load = load_keymap_list,
}
