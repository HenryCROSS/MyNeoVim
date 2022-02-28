local nvimlspinstaller = {}
local nvimlspinstaller_settings = require("nvim-lsp-installer")
local servers = require("core.lsp_config.lsp_servers")

nvimlspinstaller_settings.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- nvimlspinstaller_settings.on_server_ready(function(server)
--     local opts = { }
--     server:setup(opts)
--     vim.cmd([[ do User LspAttach Buffers ]])
-- end)

nvimlspinstaller.load = function ()
    for _, name in pairs(servers.lspInstall) do
        local server_is_found, server = nvimlspinstaller_settings.get_server(name)
        if server_is_found then
            if not server:is_installed() then
                print("Installing " .. name)
                server:install()
            end
        end
    end
end

return nvimlspinstaller
