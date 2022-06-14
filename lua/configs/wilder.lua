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
            -- local wilder = require('wilder')
            -- wilder.setup({ modes = { ':' } })

            -- wilder.set_option('renderer', wilder.popupmenu_renderer({
            --     pumblend = 20,
            --     -- highlighter = wilder.basic_highlighter(),
            --     left = { ' ', wilder.popupmenu_devicons() },
            --     right = { ' ', wilder.popupmenu_scrollbar() },
            --     highlighter = {
            --         -- wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
            --         wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
            --         -- at https://github.com/romgrk/fzy-lua-native
            --     },
            --     highlights = {
            --         accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
            --     },
            -- }))

            local wilder = require('wilder')
            wilder.setup({ modes = { ':', '/', '?' } })
            -- Disable Python remote plugin
            wilder.set_option('use_python_remote_plugin', 0)

            wilder.set_option('pipeline', {
                wilder.branch(
                    wilder.cmdline_pipeline({
                        fuzzy = 1,
                        fuzzy_filter = wilder.lua_fzy_filter(),
                    }),
                    wilder.vim_search_pipeline()
                )
            })

            wilder.set_option('renderer', wilder.renderer_mux({
                [':'] = wilder.popupmenu_renderer({
                    pumblend = 20,
                    highlighter = wilder.lua_fzy_highlighter(),
                    left = {
                        ' ',
                        wilder.popupmenu_devicons()
                    },
                    right = {
                        ' ',
                        wilder.popupmenu_scrollbar()
                    },
                    highlights = {
                        accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
                    },
                }),
                -- ['/'] = wilder.wildmenu_renderer({
                --     highlighter = wilder.lua_fzy_highlighter(),
                -- }),
            }))

        end

    },
}
