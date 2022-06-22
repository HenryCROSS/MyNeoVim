local M = {}
local fn = vim.fn

-- return hex value of the colour
M.get_colour = function (group, attr)
    return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr) 
end

M.get_hl = function(name)
    local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)
    if not ok then
        return
    end
    for _, key in pairs({"foreground", "background", "special"}) do
        if hl[key] then
            hl[key] = string.format("#%06x", hl[key])
        end
    end
    return hl
end

return M