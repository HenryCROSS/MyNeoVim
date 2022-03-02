local M = {}

M.load = function ()
    local _, value = pcall(require, "impatient")
    value.enable_profile()
    require("core.plugin_config.filetype").load()

end

return M
