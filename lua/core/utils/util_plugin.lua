local _, packer = pcall(require, "packer")
local logger = builtin_lib.log

local M = {}

function M.packer_install(plugin_arr)
    local status_ok, _ = xpcall(function()
        packer.startup(function(use)
            for _, plugins in ipairs(plugin_arr) do
                for _, plugin in ipairs(plugins) do use(plugin) end
            end
        end)
    end, debug.traceback)

if not status_ok then print("ERROR") end
end

function M.plugins_load(loading_list)
    for _, v in pairs(loading_list) do
        local ok, _ = xpcall(function()
                require(v).load()
            end,
            debug.traceback
        )
        if not ok then
            logger.LogMsg(logger.LEVELS[4], v, "The plugin is not loaded")
        end
    end
end

-- it will return a list of plugin from the specified directory in core directory
function M.search_configs(folder_name, exceptions)
    exceptions = exceptions or {}
    local dir = builtin_lib.fio.get_config_path() .. "/lua/core/" .. folder_name
    local plugin_list = builtin_lib.fio.get_file_from_dir(dir)
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

return M
