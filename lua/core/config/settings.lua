local M = {}
M.load_options = function()
    local default_options = {
        backup = false, -- creates a backup file
        clipboard = "unnamedplus", -- allows neovim to access the system clipboard
        cmdheight = 1, -- more space in the neovim command line for displaying messages
        colorcolumn = "99999", -- fixes indentline for now
        completeopt = { "menuone", "noselect" },
        conceallevel = 0, -- so that `` is visible in markdown files
        fileencoding = "utf-8", -- the encoding written to a file
        foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
        foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
        guifont = "CaskaydiaCove Nerd Font:h28", -- the font used in graphical neovim applications
        hidden = true, -- required to keep multiple buffers and open multiple buffers
        hlsearch = true, -- highlight all matches on previous search pattern
        ignorecase = true, -- ignore case in search patterns
        mouse = "a", -- allow the mouse to be used in neovim
        pumheight = 10, -- pop up menu height
        showmode = true, -- whether need to show "--INSERT--" or other mode
        showtabline = 4, -- always show tabs
        smartcase = true, -- smart case
        smartindent = true, -- make indenting smarter again
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        swapfile = false, -- creates a swapfile
        termguicolors = true, -- set term gui colors (most terminals support this)
        timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
        title = true, -- set the title of window to the value of the titlestring
        -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
        --undodir = utils.join_paths(get_cache_dir(), "undo"), -- set an undo directory
        undofile = true, -- enable persistent undo
        updatetime = 300, -- faster completion
        writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
        expandtab = true, -- convert tabs to spaces
        shiftwidth = 4, -- the number of spaces inserted for each indentation
        tabstop = 4, -- insert 2 spaces for a tab
        cursorline = true, -- highlight the current line
        cursorcolumn = true, -- hightlist the current column
        number = true, -- set numbered lines
        relativenumber = false, -- set relative numbered lines
        numberwidth = 4, -- set number column width to 4
        signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
        wrap = false, -- display lines as one long line
        spell = false,
        spelllang = "en",
        scrolloff = 8, -- is one of my fav
        sidescrolloff = 8,
        guicursor = "i:block",
        virtualedit = 'block,onemore', -- allow cursor move to one more space after the end of the line

        syntax = "on",

        tm = 1500, -- set timeout of the leader key
    }
    ---  SETTINGS  ---

    --vim.opt.shortmess:append "c"

    --vim.opt.shadafile = utils.join_paths(get_cache_dir(), "lvim.shada")

    -- change the neovim settings one by one from default_options dict
    for k, v in pairs(default_options) do
        vim.opt[k] = v
    end
end


return M
