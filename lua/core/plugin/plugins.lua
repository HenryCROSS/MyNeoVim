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
        'wbthomason/packer.nvim'
    },
    {
        -- it has a lot of problems
        -- 'TimUntersberger/neogit',
        -- requires = { "nvim-lua/plenary.nvim" },
    },
    {
        'Pocco81/AutoSave.nvim'
    },
    {
        'gelguy/wilder.nvim'
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { "nvim-lua/plenary.nvim" },
    },
    {
        'romgrk/fzy-lua-native'
    },
    {
        'glepnir/dashboard-nvim',
        disable = false,
        as = 'dashboard'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },
    {
        'nvim-lua/plenary.nvim'
    },
    {
        'sharkdp/fd'
    },
    {
        'echasnovski/mini.nvim', branch = 'stable'
    },
    {
        'folke/trouble.nvim',
    },
    {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter"
    },
    {
        -- 括号补全
        'windwp/nvim-autopairs'
    },
    {
        'seandewar/nvimesweeper'
    },
    {
        'junegunn/fzf', dir = '~/.fzf', run = './install --all'
    },
    {
        'junegunn/fzf.vim'
    },
    {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    -- {
    --   'yamatsum/nvim-nonicons',
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- },
    {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        --NOTE: you need to set other vim.g let g: nvim_tree variables BEFORE
        -- calling the setup if you want everything to work as expected :)
        -- config = function() require'nvim-tree'.setup {} end
    },
    {
        "folke/which-key.nvim",
    },
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    },
    {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    },
    {"akinsho/toggleterm.nvim"},
    {"kdheepak/lazygit.nvim"},
    {'phaazon/hop.nvim'},
    {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    },
    {
        'yamatsum/nvim-cursorline'
    },
    {
        'numToStr/Comment.nvim',
    },
    {
        'glepnir/indent-guides.nvim',
    },
    {
        'ms-jpq/coq_nvim',
    },
    {
        'ms-jpq/coq.artifacts',
        commit = 'artifacts'
    },
    {
        'ms-jpq/coq.thirdparty',
        commit = '3q'
    },
    {
        'mfussenegger/nvim-dap'
    },
    {
        'p00f/nvim-ts-rainbow'
    },
    {
        'simrat39/symbols-outline.nvim'
    },
    {
        'norcalli/nvim-colorizer.lua'
    },
    --lsp
    {
        'neovim/nvim-lspconfig'
    },
    {
        -- 与lspconfig配套
        'williamboman/nvim-lsp-installer',
    },
    -- color SCHEME
    {
        'dracula/vim',
        as = 'dracula'
    },
    {'haystackandroid/strawberry'},
    {'folke/tokyonight.nvim'},
}

return plugins
