local M = builtin_Class.GenPluginConfig:new(nil)
local treesitter_settings = require('nvim-treesitter.configs')
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

M:set_name("nvim-treesitter/nvim-treesitter")

local config = function()
    treesitter_settings.setup {
        -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "all",
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing
        ignore_install = {"phpdoc"},
        highlight = {
            -- `false` will disable the whole extension
            enable = true,
            -- list of language that will be disabled
            disable = {},
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = true,
        },
        indent = {enable = false },
        rainbow = {enable = true, extended_mode = true, max_file_lines = nil},
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm"
            }
        },
        autotag = {enable = false},
    }

    -- for neorg
    -- These two are optional and provide syntax highlighting
    -- for Neorg tables and the @document.meta tag
    parser_configs.norg_meta = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
            files = { "src/parser.c" },
            branch = "main"
        },
    }

    parser_configs.norg_table = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
            files = { "src/parser.c" },
            branch = "main"
        },
    }

    -- handle the conflit from rainbow
    vim.cmd[[augroup rainbow]]
    vim.cmd[[	au BufEnter *     hi      TSPunctBracket NONE]]
    vim.cmd[[	au BufEnter *     hi link TSPunctBracket nonexistenthl]]
    vim.cmd[[	au BufEnter *.lua hi      TSConstructor  NONE]]
    vim.cmd[[	au BufEnter *.lua hi link TSConstructor  nonexistenthl]]
    vim.cmd[[augroup END]]
end

M:append_fn(config)

return M
