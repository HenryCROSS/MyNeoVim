local null = {}
local null_settings = require('null-ls')

local sources = {
    null_settings.builtins.formatting.lua_format,
    null_settings.builtins.formatting.clang_format.with {
        args = {
            "-assume-filename=<FILENAME>",
            "-style={BasedOnStyle: Microsoft, IndentWidth: 4}"
        }
    }

}

null.load = function()
    null_settings.setup({sources = sources})
    vim.api.nvim_set_keymap('v', '<Leader>f',
                            ':lua vim.lsp.buf.formatting()<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>f',
                            ':lua vim.lsp.buf.formatting()<CR>', {})
end

return null
