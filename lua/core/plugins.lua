-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local plugins = {
    {
        "wbthomason/packer.nvim",
    },
    {
        "kristijanhusak/vim-carbon-now-sh"
    },
    {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    },
    {
        'voldikss/vim-translator'
    },
    {
        -- it has a lot of problems
        -- 'TimUntersberger/neogit',
        -- requires = { "nvim-lua/plenary.nvim" },
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
        disable = false,
        as = "dashboard",
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
        branch = "stable",
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
        -- 'ZhiyuanLck/smart-pairs',
        -- event = 'InsertEnter'
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
        requires = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "akinsho/toggleterm.nvim",
    },
    {
        "kdheepak/lazygit.nvim",
    },
    {
        "phaazon/hop.nvim",
    },
    {
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
    },
    {
        -- 'yamatsum/nvim-cursorline'
    },
    {
        "RRethy/vim-illuminate"
    },
    {
        "numToStr/Comment.nvim",
    },
    {
        -- "glepnir/indent-guides.nvim",
    },
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
    {
        -- "neoclide/coc.nvim",
        -- branch = "release",
    },
    {
        'neovim/nvim-lspconfig'
    },
    {
        -- 与lspconfig配套
        'williamboman/nvim-lsp-installer',
    },
    {
        'ray-x/lsp_signature.nvim'
    },
    {
        "onsails/lspkind-nvim"
    },
    {
        'folke/trouble.nvim',
    },
    {
        -- 'ms-jpq/coq_nvim',
        -- branch = 'coq'
    },
    {
        -- 'ms-jpq/coq.artifacts',
        -- branch = 'artifacts'
    },
    {
        -- 'ms-jpq/coq.thirdparty',
        -- branch = '3q'
    },
    -- cmp
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'hrsh7th/cmp-cmdline'
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {
        -- 'hrsh7th/cmp-vsnip'
    },
    {
        -- 'hrsh7th/vim-vsnip'
    },
    {
        -- 'hrsh7th/vim-vsnip-integ'
    },
    {
        'saadparwaiz1/cmp_luasnip'
    },
    {
        -- 'SirVer/ultisnips'
    },
    {
        -- 'quangnguyen30192/cmp-nvim-ultisnips'
    },
    {
        -- 'dcampos/nvim-snippy'
    },
    {
        -- 'dcampos/cmp-snippy'
    },
    {
        "hrsh7th/cmp-nvim-lua"
    },
    {
        "weilbith/nvim-code-action-menu"
    },
    -- snippets
    {
        "rafamadriz/friendly-snippets"
    },
    {
        "L3MON4D3/LuaSnip"
    },
    {
        'MarcWeber/vim-addon-mw-utils'
    },
    {
        'tomtom/tlib_vim'
    },
    {
        'garbas/vim-snipmate'
    },
    {
        "honza/vim-snippets"
    },
    -- color SCHEME
    {
        "dracula/vim",
        as = "dracula",
    },
    {
        "haystackandroid/strawberry",
    },
    {
        "folke/tokyonight.nvim",
    },
    {
        "rebelot/kanagawa.nvim"
    },
}

return plugins
