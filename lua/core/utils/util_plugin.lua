local _, packer = pcall(require, "packer")
local logger = builtin_lib.log

local M = {}

function M.packer_load(plugin_arr, config_dirs, exceptions)
    -- get the config table
    local config_table = {}
    local config_list = {}
    local config
    for _, dir in pairs(config_dirs) do
        config_list = M.search_configs(dir, exceptions)
        -- table.insert(config_table, M.search_configs(dir, exceptions))
        for _, config_path in pairs(config_list) do
            -- print(config_path)
            config = require(config_path)
            -- config_table[config[1]] = config.load
            -- print(config_table[tmp[1]])
            if config.name ~= nil then
                config_table[config.name] = config_path
            end
        end
    end

    -- for key, value in pairs(config_table) do
    --     print(key, value)
    -- end
            -- print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!==========")
    --
    local status_ok, _ = xpcall(function()
        packer.startup(function(use)
            -- for _, plugins in ipairs(plugin_arr) do
                for idx, plugin in pairs(plugin_arr) do
                    -- I need to connect the plugin and the config_table <<<<<<<
                                print("==================")
                            if config_table[plugin[1]] ~= nil then
                                -- print(
                                --     type(config_table[plugin[1]])
                                --     )
                                plugin["config"] =
                                    -- code
                                    -- config_table[plugin[1]]()
                                    require(config_table[plugin[1]]).load()
                                print(plugin[1], "      ", config_table[plugin[1]])
                                -- print("Name:", plugin[1],config_table[plugin[1]].load())
                                -- config_table[plugin[1]].load()
                                -- print(plugin_arr[idx][1])
                                -- print(plugin_arr[idx])
                                -- print(plugin_arr[idx].config)
                            end
                    print(plugin.config)
                                print("==================")
                    use(plugin)

                    -- if plugin_arr[idx].load ~= nil then
                    --     plugin_arr[idx].load()
                    -- end
                end
            -- end
        end)
    end, debug.traceback)

    if not status_ok then print("ERROR") end
end

function M.packer_install(plugin_arr)
    local status_ok, _ = xpcall(function()
        packer.startup(function(use)
            -- for _, plugins in ipairs(plugin_arr) do
                for _, plugin in pairs(plugin_arr) do
                    use(plugin)
                end
            -- end
        end)
    end, debug.traceback)

if not status_ok then print("ERROR") end
end

function M.load_configs(loading_list)
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

function M.ignore_configs(t)
    local result = {}
    for _, value in pairs(t) do
        result[value] = 1;
    end

    return result
end

return M
