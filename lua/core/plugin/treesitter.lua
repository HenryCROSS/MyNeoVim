local treesitter = {}
local treesitter_settings = require('nvim-treesitter.configs')

treesitter.load = function()
    treesitter_settings.setup {
        -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "all",
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing
        ignore_install = {"markdown"},
        highlight = {
            -- `false` will disable the whole extension
            enable = true,
            -- list of language that will be disabled
            disable = {},
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = true
        },
        indent = {enable = true},
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
end

return treesitter
