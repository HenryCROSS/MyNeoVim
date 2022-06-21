local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "gelguy/wilder.nvim",
        -- requires = {
        --     "romgrk/fzy-lua-native",
        --     "sharkdp/fd",
        --     "nixprime/cpsm",
        --     "kyazdani42/nvim-web-devicons",
        -- },
        config = function()
            local wilder = require('wilder')
            wilder.setup({ modes = { ':' } })

            wilder.set_option('pipeline', {
                wilder.branch(
                    wilder.cmdline_pipeline({
                        fuzzy = 1,
                        set_pcre2_pattern = 1,
                    }),
                    wilder.python_search_pipeline({
                        -- pattern = 'fuzzy',
                        -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
                        pattern = wilder.python_fuzzy_pattern(),
                        -- omit to get results in the order they appear in the buffer
                        sorter = wilder.python_difflib_sorter(),
                        -- can be set to 're2' for performance, requires pyre2 to be installed
                        -- see :h wilder#python_search() for more details
                        engine = 're',
                    }),
                    wilder.python_file_finder_pipeline({
                        -- to use ripgrep : {'rg', '--files'}
                        -- to use fd      : {'fd', '-tf'}
                        file_command = { 'find', '.', '-type', 'f', '-printf', '%P\n' },
                        -- to use fd      : {'fd', '-td'}
                        dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
                        -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
                        -- found at https://github.com/nixprime/cpsm
                        filters = { 'fuzzy_filter', 'difflib_sorter' },
                    }),
                    wilder.cmdline_pipeline(),
                    wilder.python_search_pipeline()
                ),
            })

            local highlighters = {
                wilder.pcre2_highlighter(),
                wilder.basic_highlighter(),
            }

            wilder.set_option('renderer', wilder.renderer_mux({
                [':'] = wilder.popupmenu_renderer({
                    pumblend = 20,
                    highlighter = highlighters,
                    highlights = {
                        accent = wilder.make_hl('WilderAccent', 'Pmenu',
                            { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
                    },
                    left = { ' ', wilder.popupmenu_devicons() },
                    right = { ' ', wilder.popupmenu_scrollbar() },
                }),
            }))
        end

    },
}
