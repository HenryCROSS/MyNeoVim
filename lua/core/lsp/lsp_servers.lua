local server_list = {
    -- server list
    'clangd', 'pyright', 'sumneko_lua', 'bashls', 'ltex', 'ccls', 'omnisharp',
    'tsserver', 'jdtls', 'jsonls', 'html', 'cmake', 'cssls', 'rust_analyzer',
    'powershell_es', 'sqls'
}

-- for multiple configs
server_list.load = function(server)
    for _, v in ipairs(server) do
        if v == "clangd" then
            return {
                cmd = { --
                    "clangd"
                }
                --
            }
        end
    end
end

return server_list
