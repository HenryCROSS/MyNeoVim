local uv = vim.loop
local vars = {
    -- get the runtime path
    config_path = vim.api.nvim_exec([[echo stdpath('config')]], true)
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
local function table_concat(t1,t2)
   for i=1,#t2 do
      t1[#t1+1] = t2[i]
   end
   return t1
end


local get_config_path = function ()
    return vars.config_path
end

local get_current_path = function ()
    return uv.fs_realpath(uv.cwd())
end

-- returns table of table
-- return: {file_name, type}
local get_file_from_dir = function (dir)
    local handle = uv.fs_scandir(dir)
    local files = {}

    if not handle then
        return files
    end

    while true do
        local name, t = uv.fs_scandir_next(handle)
        if not name then break end

        table.insert(files, {file_name = name, type = t})
    end

    return files
end

--[[ it will return a list of plugin from the specified directory in core directory
--   path: it starts from path "nvim/"
--]]
local function search_configs(path, folder_name, exceptions)
    exceptions = exceptions or {}
    local dir = get_config_path() .. path .. folder_name
    local plugin_list = get_file_from_dir(dir)
    local plugin_table = {}

    for _, value in pairs(plugin_list) do
        if not string.match(value.file_name, ".lua$") and value.type == "file" then
            -- not add to table
        elseif exceptions[value.file_name] then
            -- not add to table
        else
            if value.type == "file" then
                value.file_name = string.sub(value.file_name, 1, -5)
            end
            local file = "core." .. folder_name .. "." .. value.file_name
            table.insert(plugin_table, file)
        end
    end
    return plugin_table
end

local function ignore_configs(t)
    local result = {}
    for _, value in pairs(t) do
        result[value] = 1;
    end

    return result
end

return {
    const,
    table_concat,
    get_config_path,
    get_current_path,
    get_file_from_dir,
    search_configs,
    ignore_configs,
}
