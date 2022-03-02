local M = {}

M.load = function ()
    local _, value = pcall(require, "impatient")
    value.enable_profile()

end

return M
