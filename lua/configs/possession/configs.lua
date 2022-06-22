require('possession').setup {
    -- session_dir = (Path:new(vim.fn.stdpath('data')) / 'possession'):absolute(),
    silent = false,
    load_silent = true,
    debug = false,
    prompt_no_cr = false,
    autosave = {
        current = true, -- or fun(name): boolean
        tmp = false, -- or fun(): boolean
        tmp_name = 'tmp',
        on_load = true,
        on_quit = true,
    },
    commands = {
        save = 'PossessionSave',
        load = 'PossessionLoad',
        delete = 'PossessionDelete',
        show = 'PossessionShow',
        list = 'PossessionList',
        migrate = 'PossessionMigrate',
    },
    hooks = {
        before_save = function(name) return {} end,
        after_save = function(name, user_data, aborted) end,
        before_load = function(name, user_data) return user_data end,
        after_load = function(name, user_data) end,
    },
    plugins = {
        close_windows = {
            hooks = { 'before_save', 'before_load' },
            preserve_layout = true, -- or fun(win): boolean
            match = {
                floating = true,
                buftype = {},
                filetype = {},
                custom = false, -- or fun(win): boolean
            },
        },
        delete_hidden_buffers = {
            hooks = {
                'before_load',
                vim.o.sessionoptions:match('buffer') and 'before_save',
            },
            force = false, -- or fun(buf): boolean
        },
        nvim_tree = true,
        tabby = true,
        delete_buffers = true,
    },
}

local ok, telescope = pcall(require, 'telescope')
if ok then
    telescope.load_extension('possession')
    api_o_keymap.set('n', '<Leader>sl', '<cmd>Telescope possession list<cr>', { desc = "List Sessions" })
end
