-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerCompile
-- augroup end
-- ]])

local plugins = {
    {
        "wbthomason/packer.nvim",
    },
    {
        "kristijanhusak/vim-carbon-now-sh",
        opt = true,
        event = "BufRead",
        cmd = {
            "CarbonNowSh"
        }
    },
    {
        'voldikss/vim-translator',
        event = "BufRead",
        config = function ()
            require("core.plugin_config.vimtranslator").load()
        end,
        -- cmd = {
        --     "Translate",
        --     "TranslateV",
        --     "TranslateW",
        --     "TranslateWV",
        --     "TranslateR",
        --     "TranslateRV",
        --     "TranslateX",
        -- }
    },
    -- {
    --     -- it has a lot of problems
    --     -- 'TimUntersberger/neogit',
    --     -- requires = { "nvim-lua/plenary.nvim" },
    -- },
    {
        "dstein64/vim-startuptime",
        opt = true,
        -- event = "CmdlineEnter",
        cmd = {
            'StartupTime'
        }
    },
    {
        -- speed up start time
        "lewis6991/impatient.nvim"
    },
    {
        -- speed up start time
        "nathom/filetype.nvim",
        config = function ()
        end
    },
    {
        "nvim-neorg/neorg",
        ft = {"norg"},
        after = {
            "nvim-treesitter",
            "telescope.nvim",
        },
        event = "BufRead",
        config = function ()
            require("core.plugin_config.neorg").load()
        end
    },
    {
        -- graph drawing
        'jbyuki/venn.nvim',
        event = "BufRead",
        config = function ()
            require("core.plugin_config.venn").load()
        end
    },
    {
        "skywind3000/asynctasks.vim",
        event = "BufRead",
        config = function ()
            require("core.plugin_config.asynctasks").load()
        end
    },
    {
        "skywind3000/asyncrun.vim",
        event = "BufRead",
    },
    {
        'Pocco81/AutoSave.nvim',
        event = "InsertEnter",
        config = function ()
            require("core.plugin_config.autosave").load()
        end
    },
    {
        "luukvbaal/stabilize.nvim",
        event = "BufRead",
        config = function ()
            require("core.plugin_config.stabilize").load()
        end
    },
    {
        "gelguy/wilder.nvim",
        after = "fzy-lua-native",
        event = "CmdlineEnter",
        config = function ()
            require("core.plugin_config.wilder").load()
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufRead",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("core.plugin_config.nullls").load()
        end
    },
    {
        "romgrk/fzy-lua-native",
        event = "CmdlineEnter",
    },
    {
        "glepnir/dashboard-nvim",
        as = "dashboard",
        event = "VimEnter",
        config = function ()
            require("core.plugin_config.dashboard").load()
        end,
        -- cmd = {
        --   "Dashboard",
        --   "DashboardChangeColorscheme",
        --   "DashboardFindFile",
        --   "DashboardFindHistory",
        --   "DashboardFindWord",
        --   "DashboardNewFile",
        --   "DashboardJumpMarks",
        --   "SessionLoad",
        --   "SessionSave"
        -- },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        run = ":TSUpdate",
        config = function ()
            require("core.plugin_config.treesitter").load()
        end
    },
    {
        "nvim-lua/plenary.nvim",
    },
    { "sharkdp/fd" },
    {
        "echasnovski/mini.nvim",
        event = "BufRead",
        config = function ()
            require("core.plugin_config.mini").load()
        end
        -- branch = "stable",
    },
    {
        "SmiteshP/nvim-gps",
        event = "BufRead",
        config = function ()
            require("core.plugin_config.nvimgps").load()
        end
    },
    {
        -- 括号补全
        "windwp/nvim-autopairs",
        after = "nvim-treesitter",
        config = function ()
            require("core.plugin_config.autopairs").load()
        end
    },
    {
        "seandewar/nvimesweeper",
        opt = true
    },
    -- {
    --     "junegunn/fzf",
    --     opt = true,
    --     dir = "~/.fzf",
    --     run = "./install --all",
    -- },
    -- {
    --     "junegunn/fzf.vim",
    --     opt = true
    -- },
    {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    {
        "nvim-telescope/telescope.nvim",
        event = "BufRead",
        cmd = "Telescope",
        keys = {
            {'n', '<Leader>bl'},
            {'n', '<Leader>fo'},
            {'n', '<Leader>ff'},
            {'n', '<Leader>fg'},
        },
        requires = {
            {
                "nvim-lua/plenary.nvim",
            },
        },
        config = function ()
            require("core.plugin_config.telescope").load()
        end
    },
    {
        "nvim-telescope/telescope-media-files.nvim",
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
    },
    {
        "tami5/sqlite.lua",
    },
    -- {
    --   'yamatsum/nvim-nonicons',
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- },
    {
        "kyazdani42/nvim-tree.lua",
        keys = {
            'n', '<Leader>op'
        },
        config = function ()
            require("lua.core.plugin_config.nvimtree").load()
        end,
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        -- cmd = {
        --     "NvimTreeOpen",
        --     "NvimTreeFocus",
        --     "NvimTreeToggle",
        -- },
        -- NOTE: you need to set other vim.g let g: nvim_tree variables BEFORE
        -- calling the setup if you want everything to work as expected :)
        -- config = function() require'nvim-tree'.setup {} end
    },
    {
        "sheerun/vim-polyglot",
        event = "BufRead"
    },
    {
        "folke/which-key.nvim",
        -- event = "VimEnter",
        config = function ()
            require("core.plugin_config.whichkey").load()
        end
    },
    {
        "akinsho/bufferline.nvim",
        event = "BufEnter",
        requires = "kyazdani42/nvim-web-devicons",
        config = function ()
            require("core.plugin_config.bufferline").load()
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("core.plugin_config.gitsigns").load()
       end
    },
    {
        "akinsho/toggleterm.nvim",
        event = "BufRead",
        config = function ()
            require("core.plugin_config.toggleterm").load()
        end
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitFilter",
            "LazyGitConfig",
        }
    },
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function ()
            require("core.plugin_config.hop").load()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        after = "nvim-web-devicons",
        requires = {
            "kyazdani42/nvim-web-devicons",
            -- opt = true,
        },
        config = function ()
            require("core.plugin_config.lualine").load()
        end
    },
    {
        "RRethy/vim-illuminate",
        event = "BufRead",
        -- after = "nvim-lspconfig",
    },
    {
        "numToStr/Comment.nvim",
        event = "BufRead",
        config = function ()
            require("core.plugin_config.comment").load()
        end
    },
    -- {
    --     -- "glepnir/indent-guides.nvim",
    -- },
    {
        "mfussenegger/nvim-dap",
        event = "BufRead",
    },
    {
        "p00f/nvim-ts-rainbow",
        event = "BufEnter",
    },
    {
        -- 对上面的补全
        'luochen1990/rainbow',
        event = "BufEnter",
        config = function ()
            require("core.plugin_config.rainbow").load()
        end
    },
    {
        'simrat39/symbols-outline.nvim',
        event = "BufRead",
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.plugin_config.symbolsoutline").load()
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufEnter",
        config = function ()
            require("core.plugin_config.nvimcolorizer").load()
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = {
            "md",
        },
        run = ":call mkdp#util#install()",
        config = function ()
            require("core.plugin_config.markdownpreview").load()
        end
    },
    -- lsp
    {
        'j-hui/fidget.nvim',
        event = "BufRead",
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.lsp_config.fidget").load()
        end
    },
    {
        "rmagatti/goto-preview",
        event = "BufRead",
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.lsp_config.goto_preview").load()
        end
    },
    -- {
    --     -- "neoclide/coc.nvim",
    --     -- branch = "release",
    -- },
    {
        'neovim/nvim-lspconfig',
        event = "BufRead",
        after = "nvim-cmp",
        -- after = "nvim-lsp-installer",
        config = function ()
            require("core.lsp_config.lspconfig_cmp").load()
        end
    },
    {
        -- 与lspconfig配套
        'williamboman/nvim-lsp-installer',
        event = "BufRead",
        config = function ()
            require("core.lsp_config.nvimlspinstaller").load()
        end
    },
    {
        'ray-x/lsp_signature.nvim',
        event = "BufRead",
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.lsp_config.lsp_signature").load()
        end
    },
    {
        "onsails/lspkind-nvim",
        after = "LuaSnip"
    },
    {
        'folke/trouble.nvim',
        event = "BufRead",
        -- after = "nvim-lspconfig"

    },
    -- {
    --     -- 'ms-jpq/coq_nvim',
    --     -- branch = 'coq'
    -- },
    -- {
    --     -- 'ms-jpq/coq.artifacts',
    --     -- branch = 'artifacts'
    -- },
    -- {
    --     -- 'ms-jpq/coq.thirdparty',
    --     -- branch = '3q'
    -- },
    -- cmp
    {
        'hrsh7th/cmp-nvim-lsp',
        -- event = "BufRead",
        after = "nvim-cmp",
    },
    {
        'hrsh7th/cmp-buffer',
        after = "LuaSnip",
    },
    {
        'hrsh7th/cmp-path',
        event = "BufRead",
    },
    {
        'hrsh7th/cmp-cmdline',
        event = "BufRead",
    },
    {
        'hrsh7th/nvim-cmp',
        after = "cmp-buffer",
        config = function ()
            require("core.lsp_config.cmp").load()
        end,
    },
    {
        'saadparwaiz1/cmp_luasnip',
        event = "BufRead",
    },
    {
        "hrsh7th/cmp-nvim-lua",
        event = "BufRead",
        -- event = "BufRead",

    },
    {
        "weilbith/nvim-code-action-menu",
        event = "BufRead",
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.lsp_config.codeactionmenu").load()
        end,
    },
    -- snippets
    {
        "rafamadriz/friendly-snippets",
        -- event = "BufRead",
        -- event = "BufEnter",
        event = "InsertEnter"
    },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        -- after = "nvim-cmp",
    },
    {
        'MarcWeber/vim-addon-mw-utils'
    },
    {
        'tomtom/tlib_vim'
    },
    {
        'garbas/vim-snipmate',
        event = "InsertEnter",
        -- after = "nvim-cmp"
    },
    {
        "honza/vim-snippets",
        event = "InsertEnter",
        -- after = "nvim-cmp"
    },
    -- color SCHEME
    -- {
    --     "dracula/vim",
    --     as = "dracula",
    -- },
    -- {
    --     "haystackandroid/strawberry",
    -- },
    -- {
    --     "folke/tokyonight.nvim",
    --     -- opt = true
    -- },
    {
        "rebelot/kanagawa.nvim",
        event = "VimEnter",
        config = function ()
            require("core.theme").load()
        end
        -- after = "nvim-treesitter"
    },
}

return plugins
