local server_list = {
    -- server list
    'clangd', 'pyright', 'sumneko_lua', 'bashls', 'ltex'
}

-- for multiple configs
server_list.load = function(servers)
    for _, server in ipairs(servers) do
        if server == "clangd" then
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
