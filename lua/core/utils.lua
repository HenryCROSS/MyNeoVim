local uv = vim.loop
local vim_vars = {
    -- get the runtime path
    config_path = vim.api.nvim_exec([[echo stdpath('config')]], true),
    version = vim.inspect(vim.version())
}

local function const(tbl)
    return setmetatable({}, {
        __index = tbl,
        __newindex = function(_, key, value)
            error("attempting to change constant " ..
                tostring(key) .. " to " .. tostring(value), 2)
        end
    })
end

-- combine t2 to t1
local function table_concat(t1, t2)
    if (t2 ~= nil) then
        for key, value in pairs(t2) do
            t1[key] = value
        end
    end

    return t1
end

local function table_insert(t1, t2)
    if (t2 ~= nil) then
        if (t1 == nil) then
            t1 = {}
        end

        for _, value in pairs(t2) do
            table.insert(t1, value)
        end
    end

    return t1
end

local function table_insert_as_key(t1, t2)
    if (t2 ~= nil) then
        for _, value in pairs(t2) do
            t1[value] = value
        end
    end

    return t1
end

local function table_shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

local function table_deepcopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
            end
            setmetatable(copy, deepcopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- return a reverse table: {"a"}  -> {1 : "a"} ; {"a" : "b"} -> {"b" : "a"}
local function table_reverse(tbl)
    local result = {}

    for k, v in pairs(tbl) do
        result[v] = k
    end

    return result
end

local function string_is_empty(s)
    return s == nil or s == ''
end

local get_config_path = function()
    return vim_vars.config_path
end

local get_current_path = function()
    return uv.fs_realpath(uv.cwd())
end

-- returns table of table
-- return: {file_name, type}
local get_file_from_dir = function(dir)
    local handle = uv.fs_scandir(dir)
    local files = {}

    if not handle then
        return files
    end

    while true do
        local name, t = uv.fs_scandir_next(handle)
        if not name then break end

        table.insert(files, { file_name = name, type = t })
    end

    return files
end

--[[ it will return a list of config from the specified directory
--   path: it starts from path "nvim/lua/"
--   return: a table contains files including the variable path
--           and without the .lua postfix
--   {
--   {{path/name}},
--   {{path/name}},
--   ...
--   }
--]]
local function search_configs(path, exceptions)
    exceptions = exceptions or {}
    local dir = get_config_path() .. "/lua/" .. path
    local files = get_file_from_dir(dir)
    local plugin_table = {}

    for _, value in pairs(files) do
        if not string.match(value.file_name, ".lua$") and value.type == "file" then
            -- not add to table
        elseif exceptions[value.file_name] then
            -- not add to table
        else
            if value.type == "file" then
                -- remove .lua from the file name
                value.file_name = string.sub(value.file_name, 1, -5)
            end
            local file = path .. "." .. value.file_name
            table.insert(plugin_table, file)
        end
    end
    return plugin_table
end

local function get_nvim_ver()
    return vim_vars.version
end

local function rm_plugin_prefix(name)
    local pos = string.find(name, "/")
    return string.sub(name, pos + 1, #name)
end

return {
    const = const,
    table_concat = table_concat,
    table_insert = table_insert,
    table_insert_as_key = table_insert_as_key,
    table_deepcopy = table_deepcopy,
    table_shallowcopy = table_shallowcopy,
    table_reverse = table_reverse,
    get_config_path = get_config_path,
    get_current_path = get_current_path,
    get_file_from_dir = get_file_from_dir,
    search_configs = search_configs,
    get_nvim_ver = get_nvim_ver,
    rm_plugin_prefix = rm_plugin_prefix,
    string_is_empty = string_is_empty,
}
