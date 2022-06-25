local M = {}

M.p = function (v)
    print(vim.inspect(v))
    return v
end

M.reload = function (...)
    local ok, reload = pcall(require, "plenary.reload")
    if ok then
        return reload.reload_module(...)
    end
end

M.r = function(name)
    M.reload(name)
    return require(name)
end

return M
