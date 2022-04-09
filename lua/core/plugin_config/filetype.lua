local M = {}

M.name = "nathom/filetype.nvim"

M.load = function ()
    if vim.fn.has('nvim-0.6') ~= 1 then
        -- Do not source the default filetype.vim
        vim.g.did_load_filetypes = 1
    end

    -- In init.lua or filetype.nvim's config file
    require("filetype").setup({
            overrides = {
                extensions = {
                    -- Set the filetype of *.pn files to potion
                    pn = "potion",
                },
                literal = {
                    -- Set the filetype of files named "MyBackupFile" to lua
                    MyBackupFile = "lua",
                },
                complex = {
                    -- Set the filetype of any full filename matching the regex to gitconfig
                    [".*git/config"] = "gitconfig", -- Included in the plugin
                },

                -- The same as the ones above except the keys map to functions
                function_extensions = {
                    ["cpp"] = function()
                        vim.bo.filetype = "cpp"
                        -- Remove annoying indent jumping
                        vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
                    end,
                    ["txt"] = function ()
                        vim.bo.filetype = "txt"
                    end,
                    ["pdf"] = function()
                        vim.bo.filetype = "pdf"
                        -- Open in PDF viewer (Skim.app) automatically
                        vim.fn.jobstart(
                            "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
                            )
                    end,
                },
                function_literal = {
                    Brewfile = function()
                        vim.cmd("syntax off")
                    end,
                },
                function_complex = {
                    ["*.math_notes/%w+"] = function()
                        vim.cmd("iabbrev $ $$")
                    end,
                },

                shebang = {
                    -- Set the filetype of files with a dash shebang to sh
                    dash = "sh",
                },
            },
        })
end

return M
