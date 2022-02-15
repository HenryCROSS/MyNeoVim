local M = {}

function M:load()
    require('core.plugin.plugin_loader').load(require("core.plugin.plugins"))
    require("core.plugin.plugin_settings").load()
    require("core.lsp").load()
end

return M
