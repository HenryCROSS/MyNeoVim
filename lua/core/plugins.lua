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
        cmd = {
            "CarbonNowSh"
        }
    },
    {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    },
    {
        'voldikss/vim-translator',
        cmd = {
            "Translate",
            "TranslateV",
            "TranslateW",
            "TranslateWV",
            "TranslateR",
            "TranslateRV",
            "TranslateX",
        }
    },
    -- {
    --     -- it has a lot of problems
    --     -- 'TimUntersberger/neogit',
    --     -- requires = { "nvim-lua/plenary.nvim" },
    -- },
    {
        "dstein64/vim-startuptime",
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
        "nathom/filetype.nvim"
    },
    {
        "nvim-neorg/neorg",
    },
    {
        -- graph drawing
        'jbyuki/venn.nvim'
    },
    {
        "skywind3000/asynctasks.vim",
    },
    {
        "skywind3000/asyncrun.vim",
    },
    {
        'Pocco81/AutoSave.nvim'
    },
    {
        "luukvbaal/stabilize.nvim",
    },
    {
        "gelguy/wilder.nvim",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "romgrk/fzy-lua-native",
    },
    {
        "glepnir/dashboard-nvim",
        as = "dashboard",
        config = function ()
            require("core.plugin_config.dashboard").load()
        end
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
        run = ":TSUpdate",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    { "sharkdp/fd" },
    {
        "echasnovski/mini.nvim",
        -- branch = "stable",
    },
    {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
    },
    {
        -- 括号补全
        "windwp/nvim-autopairs",
    },
    {
        "seandewar/nvimesweeper",
    },
    {
        "junegunn/fzf",
        dir = "~/.fzf",
        run = "./install --all",
    },
    {
        "junegunn/fzf.vim",
    },
    {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    {
        "nvim-telescope/telescope.nvim",
        requires = {
            {
                "nvim-lua/plenary.nvim",
            },
        },
    },
    {
        "nvim-telescope/telescope-media-files.nvim",
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', run = 'make'
    },
    {
        "tami5/sqlite.lua"
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        requires = {"tami5/sqlite.lua"}
    },
    -- {
    --   'yamatsum/nvim-nonicons',
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- },
    {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        -- NOTE: you need to set other vim.g let g: nvim_tree variables BEFORE
        -- calling the setup if you want everything to work as expected :)
        -- config = function() require'nvim-tree'.setup {} end
    },
    {
        "sheerun/vim-polyglot"
    },
    {
        "folke/which-key.nvim",
    },
    {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = {
            "nvim-lua/plenary.nvim",
        },
       --  config = function()
       --      require("core.plugin_config.gitsigns").load()
       -- end
    },
    {
        "akinsho/toggleterm.nvim",
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
        event = "InsertEnter",
       --  config = function()
       --      require("core.plugin_config.hop").load()
       -- end
    },
    {
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            -- opt = true,
        },
    },
    {
        "RRethy/vim-illuminate"
    },
    {
        "numToStr/Comment.nvim",
    },
    -- {
    --     -- "glepnir/indent-guides.nvim",
    -- },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "p00f/nvim-ts-rainbow",
    },
    {
        -- 对上面的补全
        'luochen1990/rainbow'
    },
    {
        'simrat39/symbols-outline.nvim'
    },
    {
        "norcalli/nvim-colorizer.lua",
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = {
            "markdown",
        },
        run = ":call mkdp#util#install()",
    },
    -- lsp
    {
        'j-hui/fidget.nvim'
    },
    {
        "rmagatti/goto-preview"
    },
    -- {
    --     -- "neoclide/coc.nvim",
    --     -- branch = "release",
    -- },
    {
        'neovim/nvim-lspconfig',
        -- event = "BufEnter"
    },
    {
        -- 与lspconfig配套
        'williamboman/nvim-lsp-installer',
        -- after = "nvim-lspconfig"
    },
    {
        'ray-x/lsp_signature.nvim',
        -- after = "nvim-lspconfig"
    },
    {
        "onsails/lspkind-nvim"
    },
    {
        'folke/trouble.nvim',
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
        after = "nvim-cmp"

    },
    {
        'hrsh7th/cmp-buffer',
        after = "nvim-cmp"

    },
    {
        'hrsh7th/cmp-path',
        after = "nvim-cmp"

    },
    {
        'hrsh7th/cmp-cmdline',
        after = "nvim-cmp"

    },
    {
        'hrsh7th/nvim-cmp',
        -- after = "friendly-snippets",
    },
    -- {
    --     -- 'hrsh7th/cmp-vsnip'
    -- },
    -- {
    --     -- 'hrsh7th/vim-vsnip'
    -- },
    -- {
    --     -- 'hrsh7th/vim-vsnip-integ'
    -- },
    {
        'saadparwaiz1/cmp_luasnip',
        after = "nvim-cmp"
    },
    -- {
    --     -- 'SirVer/ultisnips'
    -- },
    -- {
    --     -- 'quangnguyen30192/cmp-nvim-ultisnips'
    -- },
    -- {
    --     -- 'dcampos/nvim-snippy'
    -- },
    -- {
    --     -- 'dcampos/cmp-snippy'
    -- },
    {
        "hrsh7th/cmp-nvim-lua",
        after = "nvim-cmp"

    },
    {
        "weilbith/nvim-code-action-menu",
        after = "nvim-lspconfig"
    },
    -- snippets
    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter"
    },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter"
    },
    {
        'MarcWeber/vim-addon-mw-utils'
    },
    {
        'tomtom/tlib_vim'
    },
    {
        'garbas/vim-snipmate',
        after = "nvim-cmp"
    },
    {
        "honza/vim-snippets",
        after = "nvim-cmp"
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
        -- after = "nvim-treesitter"
    },
}

return plugins
