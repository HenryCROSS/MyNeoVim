local null = {}
local null_settings =
    require(
        "null-ls"
    )

local sources = {
    null_settings.builtins.diagnostics.zsh,
    null_settings.builtins
        .formatting
        .lua_format,
    null_settings.builtins
        .formatting
        .clang_format
        .with {
        args = {
            "-assume-filename=<FILENAME>",
            "-style={BasedOnStyle: Microsoft, IndentWidth: 4}",
        },
    },
    null_settings.builtins
        .formatting
        .prettierd,

}

null.name = "jose-elias-alvarez/null-ls"

null.load =
    function()
        null_settings.setup(
            {
                sources = sources,
            }
        )
        -- vim.api.nvim_del_keymap("n","<Space>f")
        vim.api
            .nvim_set_keymap(
            "v",
            "<Leader>cf",
            ":lua vim.lsp.buf.formatting()<CR>",
            {}
        )
        vim.api
            .nvim_set_keymap(
            "n",
            "<Leader>cf",
            ":lua vim.lsp.buf.formatting()<CR>",
            {noremap = true}
        )
    end

return null
