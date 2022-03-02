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
        event = "BufRead",
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
            require("core.plugin_config.filetype").load()
        end
    },
    {
        "nvim-neorg/neorg",
        ft = {"norg"},
        config = function ()
            require("core.plugin_config.neorg").load()
        end
    },
    {
        -- graph drawing
        'jbyuki/venn.nvim',
        event = "InsertEnter",
        config = function ()
            require("core.plugin_config.venn").load()
        end
    },
    {
        "skywind3000/asynctasks.vim",
        config = function ()
            require("core.plugin_config.asynctasks").load()
        end
    },
    {
        "skywind3000/asyncrun.vim",
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
        config = function ()
            require("core.plugin_config.wilder").load()
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("core.plugin_config.nullls").load()
        end
    },
    {
        "romgrk/fzy-lua-native",
    },
    {
        "glepnir/dashboard-nvim",
        as = "dashboard",
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
        -- event = "BufRead",
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
        event = "BufEnter",
        config = function ()
            require("core.plugin_config.mini").load()
        end
        -- branch = "stable",
    },
    {
        "SmiteshP/nvim-gps",
        config = function ()
            require("core.plugin_config.nvimgps").load()
        end
    },
    {
        -- 括号补全
        "windwp/nvim-autopairs",
        -- after = "nvim-cmp",
        config = function ()
            require("core.plugin_config.autopairs").load()
        end
    },
    {
        "seandewar/nvimesweeper",
        opt = true
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
        config = function ()
            require("core.plugin_config.telescope").load()
        end
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
        event = "VimEnter",
        config = function ()
            require("core.plugin_config.whichkey").load()
        end
    },
    {
        "akinsho/bufferline.nvim",
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
        event = "BufEnter",
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
        event = "BufEnter",
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
        event = "BufEnter",
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
        event = "BufRead",
    },
    {
        -- 对上面的补全
        'luochen1990/rainbow',
        event = "BufRead",
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
        -- event = "BufEnter",
        config = function ()
            require("core.lsp_config.lspconfig_cmp").load()
        end
    },
    {
        -- 与lspconfig配套
        'williamboman/nvim-lsp-installer',
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
        -- after = "luasnip",
    },
    {
        'hrsh7th/cmp-buffer',
    },
    {
        'hrsh7th/cmp-path',
    },
    {
        'hrsh7th/cmp-cmdline',

    },
    {
        'hrsh7th/nvim-cmp',
    },
    {
        'saadparwaiz1/cmp_luasnip',
    },
    {
        "hrsh7th/cmp-nvim-lua",
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
        event = "BufRead",
        -- event = "BufEnter",
        -- event = "InsertEnter"
    },
    {
        "L3MON4D3/LuaSnip",
        -- event = "BufRead",
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
        event = "BufRead",
        -- after = "nvim-cmp"
    },
    {
        "honza/vim-snippets",
        event = "BufRead",
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
