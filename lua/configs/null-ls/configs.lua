local null_settings = require("null-ls")
local sources = {
    -- null_settings.builtins.diagnostics.zsh,
    -- null_settings.builtins.code_actions.shellcheck,
    -- null_settings.builtins.diagnostics.shellcheck,
    null_settings.builtins.formatting.shellharden,
    -- null_settings.builtins.formatting.shfmt,
    null_settings.builtins.formatting.rustfmt,
    -- null_settings.builtins.code_actions.gitsigns,

    -- null_settings.builtins.diagnostics.cppcheck,

    null_settings.builtins.formatting.lua_format,
    null_settings.builtins.formatting.autopep8,
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
null_settings.setup(
    {
        sources = sources,
    }
)
-- vim.api.nvim_del_keymap("n","<Space>f")
vim.api
    .nvim_set_keymap(
        "v",
        "<Leader>nf",
        ":lua vim.lsp.buf.formatting()<CR>",
        {}
    )
vim.api
    .nvim_set_keymap(
        "n",
        "<Leader>nf",
        ":lua vim.lsp.buf.format({async=true})<CR>",
        { noremap = true }
    )
