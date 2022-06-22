local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "rmagatti/session-lens",
        requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
        config = function()
            require("telescope").load_extension("session-lens")
            require('session-lens').setup {
                path_display = { 'shorten' },
                theme_conf = { border = true },
                previewer = true,
                prompt_title = 'YEAH SESSIONS',
            }
            api_o_keymap.set('n', '<Leader>sl', '<cmd>SearchSession<cr>', { desc = "List Sessions" })
        end

    },
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "rmagatti/auto-session",
        config = function()
            require("configs.autosession.configs")
        end

    },
}
