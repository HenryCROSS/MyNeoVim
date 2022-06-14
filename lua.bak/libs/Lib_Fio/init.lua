local M = {}
local uv = vim.loop
local lib_vars = {
    -- get the runtime path
    config_path = vim.api.nvim_exec([[echo stdpath('config')]], true)
}

M.get_config_path = function ()
    return lib_vars.config_path
end

M.get_current_path = function ()
    return uv.fs_realpath(uv.cwd())
end

-- returns table of table
-- return: {file_name, type}
M.get_file_from_dir = function (dir)
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

return M
