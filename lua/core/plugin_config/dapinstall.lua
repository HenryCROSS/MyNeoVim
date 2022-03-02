local M = {}

M.load = function ()
    local dap_install = require("dap-install")
    local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

    dap_install.setup({
            installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
        })

    for _, debugger in ipairs(dbg_list) do
        dap_install.config(debugger)
    end
end

return  M
