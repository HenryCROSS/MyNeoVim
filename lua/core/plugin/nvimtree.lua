local nvimtree_settings = {}
local nvimtree = require("nvim-tree")
local config = {}

nvimtree_settings.load = function()
    vim.g.nvim_tree_quit_on_open = 0
    vim.g.open_on_tab = 1
    vim.g.nvim_tree_respect_buf_cwd = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_show_icons = {
        git = 0,
        folders = 1,
        files = 1,
        folder_arrows = 1
    }

    -- keymapping
    vim.api.nvim_set_keymap('n', '<Leader><Space>', ':NvimTreeToggle<CR>',
                            {noremap = true, silent = true})

    -- setup
    require'nvim-tree'.setup {
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        auto_close = true,
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = true,
		highlight_opened_files = true,
        update_to_buf_dir = {enable = false, auto_open = true},
        diagnostics = {
            enable = false,
            icons = {hint = "", info = "", warning = "", error = ""}
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {}
        },
        system_open = {cmd = nil, args = {}},
        filters = {dotfiles = false, custom = {}},
        git = {enable = true, ignore = true, timeout = 500},
        view = {
            width = 30,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            auto_resize = true,
            mappings = {custom_only = false, list = {}},
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        trash = {cmd = "trash", require_confirm = true},
        show_icons = {git = 1, folders = 1, folder_arrows = 1, tree_width = 30},
        allow_resize = 1,

    }
end

return nvimtree_settings
