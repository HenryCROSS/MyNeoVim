local _, packer = pcall(require, "packer")
local logger = require("libs.Lib_Log")

local M = { }

function M.packer_install(plugin_arr)
    local status_ok, _ = xpcall(function ()
        packer.startup(function (use)
            for _, plugins in ipairs(plugin_arr) do
                for _, plugin in ipairs(plugins) do
                    use(plugin)
                end
            end
        end)
    end, debug.traceback)

    if not status_ok then
        print("ERROR")
    end
end

function M.plugins_load(loading_list)
    -- dracula
    vim.cmd [[colorscheme kanagawa]]
    --vim.cmd [[colorscheme strawberry-light]]
    --

    for _,v in ipairs(loading_list) do
        local ok, mod = pcall(require, v)
        if not ok then
            logger.LogMsg(logger.LEVELS[2], v, "The plugin is not loaded")
        else
            mod.load()
        end
    end
end

return M
