local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.AUGROUP,
        name = "test_group",
        id = vim.api.nvim_create_augroup("test_group", {
            clear = true
        })
    },
    {
        type = PROPERTY.AUGROUP,
        name = "txt_file",
        id = vim.api.nvim_create_augroup("txt_file", {
            clear = true
        })
    },
    {
        type = PROPERTY.AUTOCMD,
        name = "txt_file_settings",
        config = {
            wrap = function()
                vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
                    pattern = { "*.txt" },
                    group = "txt_file",
                    callback = function()
                        print("hello txt")
                    end
                })
            end
        }
    },
    {
        type = PROPERTY.AUTOCMD,
        name = "debug",
        config = {
            wrap = function()
                vim.api.nvim_create_autocmd({ "VimEnter" }, {
                    group = "test_group",
                    pattern = { "*" },
                    callback = function()
                        -- local ls = api_o_config.group.getOne("THEME")
                        -- for key, value in pairs(ls) do
                        --     print(key .. " " .. value)
                        -- end
                    end
                })
            end
        }
    }
}
