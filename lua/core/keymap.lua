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

--[[
    {
        [name] = {
            [lhs] = {
                modes = ....,
                lhs = ....,
                rhs = ....,
                opts = ....,
            },
            .....
        },
        ......
    }
]]
local key_list = {}

local table_concate = require("core.utils").table_concat

-- convert list to table
local convert_list = function (lz)
    local result = {}
    for _, value in ipairs(lz) do
        table.insert(result, {
            modes = value[1],
            lhs = value[2],
            rhs = value[3],
            opts = value[4]
        })
    end

    return result
end

local function set_keymap(modes, lhs, rhs, opts)
    vim.keymap.set(modes, lhs, rhs, opts)
end

local function rm_keymap(modes, lhs)
    vim.keymap.del(modes, lhs)
end

local function get_keymap_list(modes, lhs)
    return key_list
end

local function register_keymap(keymaps)
    if type(keymaps) == "table" then
        key_list[keymaps.name] = key_list[keymaps.name] or {}

        for key, value in pairs(keymaps.config) do
            key_list[keymaps.name][value.lhs] = value
        end
    end
end

--[[
    deleted by lhs or whole keymap group
]]
local function degregister_keymap(keymaps)
    if key_list[keymaps.name] == nil then
        return
    end

    -- remove all if only contains the name
    if keymaps.config == nil then
        key_list[keymaps.name] = nil
    end

    if type(keymaps) == "table" then
        local keys = key_list[keymaps.name]

        for idx, lhs in ipairs(keymaps.config) do
            key_list[keymaps.name][lhs] = nil
        end
    end
end

local function mask_opts(mask, new_opts)
    return table_concate(vim.deepcopy(mask), new_opts)
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

local function load_keymap_list()
    for k, keymaps in pairs(key_list) do
        for _, keymap in pairs(keymaps) do
            set_keymap(keymap.modes, keymap.lhs, keymap.rhs, keymap.opts)
        end
    end
end

return {
    get = get_keymap_list,
    set = set_keymap,
    rm = rm_keymap,
    register = register_keymap,
    degregister = degregister_keymap,
    mask = mask_opts,
    load = load_keymap_list,
    lzToTbl = convert_list,
}
