local PROPERTY = api_o_const.PROPERTY
return {
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
    }
}
