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
        --event = {"BufRead", "BufNewFile"},
        cmd = {
            "CarbonNowSh"
        }
    },
    {
        'ethanholz/nvim-lastplace',
        --event = {"BufReadPre"},
        config = function ()
            require'nvim-lastplace'.setup {
                lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                lastplace_open_folds = true
            }
        end
    },
    {
        'voldikss/vim-translator',
        -- --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.vimtranslator").load()
        end,
        keys = {
            {"n", "<Leader>tw"},
            {"v", "<Leader>tw"},
            {"n", "<Leader>tt"},
            {"v", "<Leader>tt"},
            {"n", "<Leader>tr"},
            {"v", "<Leader>tr"},
            {"n", "<Leader>tx"},
        },
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
    {
        "uga-rosa/translate.nvim",
        opt = true,
        config = function ()
            require("core.plugin_config.translatenvim").load()
        end,
    },
    -- {
    --     -- it has a lot of problems
    --     -- 'TimUntersberger/neogit',
    --     -- requires = { "nvim-lua/plenary.nvim" },
    -- },
    {
        "dstein64/vim-startuptime",
        opt = true,
        -- --event = "CmdlineEnter",
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
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.neorg").load()
        end
    },
    {
        -- graph drawing
        'jbyuki/venn.nvim',
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.venn").load()
        end
    },
    {
        "skywind3000/asynctasks.vim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.asynctasks").load()
        end
    },
    {
        "skywind3000/asyncrun.vim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.asyncrun").load()
        end
    },
    {
        'Pocco81/AutoSave.nvim',
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.autosave").load()
        end
    },
    {
        "luukvbaal/stabilize.nvim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.stabilize").load()
        end
    },
    {
        "gelguy/wilder.nvim",
        after = "fzy-lua-native",
        --event = "CmdlineEnter",
        config = function ()
            require("core.plugin_config.wilder").load()
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        --event = {"BufRead", "BufNewFile"},
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("core.plugin_config.nullls").load()
        end
    },
    {
        "romgrk/fzy-lua-native",
        --event = "CmdlineEnter",
    },
    {
        "glepnir/dashboard-nvim",
        as = "dashboard",
        --event = "VimEnter",
        config = function ()
            require("core.plugin_config.dashboard"):load()
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
        --event = {"BufRead", "BufNewFile"},
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
        "ThePrimeagen/refactoring.nvim",
        after = {"telescope.nvim"},
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"},
            {"nvim-telescope/telescope.nvim"},
        },
        config = function ()
            require("core.plugin_config.refactoring").load()
        end
    },
    {
        "echasnovski/mini.nvim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.mini").load()
        end
        -- branch = "stable",
    },
    {
        "SmiteshP/nvim-gps",
        after = {"nvim-treesitter"},
        requires = "nvim-treesitter/nvim-treesitter",
        -- --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.nvimgps").load()
        end
    },
    {
        -- 括号补全
        "windwp/nvim-autopairs",
        after = "nvim-treesitter",
        --event = "InsertEnter",
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
        --event = {"BufRead", "BufNewFile"},
        -- cmd = "Telescope",
        -- keys = {
        --     {'n', '<Leader>bl'},
        --     {'n', '<Leader>fo'},
        --     {'n', '<Leader>ff'},
        --     {'n', '<Leader>fg'},
        --     {'n', '<Leader>fb'},
        -- },
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
        "GustavoKatel/telescope-asynctasks.nvim",
        after = {
            -- "telescope.nvim",
            "asynctasks.vim",
            "asyncrun.vim",
        },
        config = function ()
            vim.api.nvim_set_keymap("n", "<leader>at", ":lua require('telescope').extensions.asynctasks.all()<cr>"
            , {})
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        after = "telescope.nvim",
        config = function ()
            require("telescope").load_extension "file_browser"
        end
    },
    {
        "nvim-telescope/telescope-media-files.nvim",
        after = "telescope.nvim",
        config = function ()
            require('telescope').load_extension('media_files')
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
        after = "telescope.nvim",
        config = function ()
            -- it is very annoying to setup these in Windows, fuck it
            if vim.loop.os_uname().sysname ~= "Windows_NT" then
               require('telescope').load_extension('fzf')
            end
        end
    },
    -- {
    --     "tami5/sqlite.lua",
    -- },
    -- {
    --   'yamatsum/nvim-nonicons',
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- },
    -- {
    --     "kyazdani42/nvim-tree.lua",
    --     keys = {
    --         'n', '<Leader>op'
    --     },
    --     config = function ()
    --         require("core.plugin_config.nvimtree").load()
    --     end,
    --     requires = {
    --         "kyazdani42/nvim-web-devicons", -- optional, for file icon
    --     },
    --     -- cmd = {
    --     --     "NvimTreeOpen",
    --     --     "NvimTreeFocus",
    --     --     "NvimTreeToggle",
    --     -- },
    --     -- NOTE: you need to set other vim.g let g: nvim_tree variables BEFORE
    --     -- calling the setup if you want everything to work as expected :)
    --     -- config = function() require'nvim-tree'.setup {} end
    -- },
    {
        "nvim-neo-tree/neo-tree.nvim",
        -- keys = {
        --     'n', '<Leader>op'
        -- },
        branch = "v2.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim"
        },
        config = function ()
            require("core.plugin_config.neotree").load()
        end,
    },
    {
        "sheerun/vim-polyglot",
        --event = {"BufRead", "BufNewFile"}
    },
    {
        "folke/which-key.nvim",
        -- --event = "VimEnter",
        config = function ()
            require("core.plugin_config.whichkey").load()
        end
    },
    {
        "akinsho/bufferline.nvim",
        --event = "BufEnter",
        requires = "kyazdani42/nvim-web-devicons",
        config = function ()
            require("core.plugin_config.bufferline").load()
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        --event = {"BufRead", "BufNewFile"},
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("core.plugin_config.gitsigns").load()
       end
    },
    {
        "petertriho/nvim-scrollbar",
        config = function ()
            require("core.plugin_config.scrollbar"):load()
        end,
    },
    {
        "famiu/bufdelete.nvim",
        --event = {"BufRead", "BufNewFile"},
        config = function()
            require("core.plugin_config.bufdelete").load()
       end
    },
    {
        "matbme/JABS.nvim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.jabs").load()
        end
    },
    {
        "akinsho/toggleterm.nvim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.toggleterm").load()
        end
    },
    -- {
    --     "kdheepak/lazygit.nvim",
    --     cmd = {
    --         "LazyGit",
    --         "LazyGitFilter",
    --         "LazyGitConfig",
    --     }
    -- },
    {
        "phaazon/hop.nvim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.hop").load()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        -- after = "nvim-web-devicons",
        -- after = "kanagawa.nvim",
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
        --event = {"BufRead", "BufNewFile"},
        -- after = "nvim-lspconfig",
    },
    {
        "numToStr/Comment.nvim",
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.comment").load()
        end
    },
    -- {
    --     -- "glepnir/indent-guides.nvim",
    -- },
    {
        "michaelb/sniprun",
        run = 'bash ./install.sh',
        --event = {"BufRead", "BufNewFile"},
        config = function ()
            require("core.plugin_config.sniprun"):load()
        end
    },
    {
        "mfussenegger/nvim-dap",
        opt = true,
        --event = "BufReadPre",
        config = function ()
            require("core.plugin_config.nvimdap").load()
        end
    },
    {
        "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"},
        after = "nvim-dap",
        config = function ()
            require("core.plugin_config.dapui").load()
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        after = {"nvim-dap", "nvim-treesitter"},
        config = function ()
            require("core.plugin_config.dapvirtualtext").load()
        end
    },
    {
        "Pocco81/DAPInstall.nvim",
        --event = "BufReadPre",
        config = function ()
            require("core.plugin_config.dapinstall").load()
        end
    },
    {
        "p00f/nvim-ts-rainbow",
        --event = {"BufRead", "BufNewFile"},
    },
    {
        -- 对上面的补全
        'luochen1990/rainbow',
        -- --event = "BufReadPost",
        config = function ()
            require("core.plugin_config.rainbow").load()
        end
    },
    {
        'simrat39/symbols-outline.nvim',
        --event = {"BufRead", "BufNewFile"},
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.plugin_config.symbolsoutline").load()
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        -- --event = "BufEnter",
        --event = {"BufReadPre", "BufNewFile"},
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
    {
        "rcarriga/nvim-notify",
        config = function ()
            require("core.plugin_config.notify").load()
        end
    },
    -- lsp
    {
        'j-hui/fidget.nvim',
        --event = {"BufRead", "BufNewFile"},
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.lsp_config.fidget").load()
        end
    },
    {
        "rmagatti/goto-preview",
        --event = {"BufRead", "BufNewFile"},
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
        --event = {"BufRead", "BufNewFile"},
        after = "cmp-nvim-lsp",
        -- after = "nvim-lsp-installer",
        config = function ()
            require("core.lsp_config.lspconfig_cmp").load()
        end
    },
    {
        -- 与lspconfig配套
        'williamboman/nvim-lsp-installer',
        --event = {"BufRead", "BufNewFile"},
        after = "cmp-nvim-lsp",
        config = function ()
            require("core.lsp_config.nvimlspinstaller").load()
        end
    },
    {
        'ray-x/lsp_signature.nvim',
        --event = {"BufRead", "BufNewFile"},
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
        --event = {"BufRead", "BufNewFile"},
        -- after = "nvim-lspconfig"
        config = function ()
            require("core.plugin_config.trouble").load()
        end
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
        --event = {"BufRead", "BufNewFile"},
        -- --event = "BufRead",
    },
    {
        'hrsh7th/cmp-buffer',
        after = "nvim-cmp",
    },
    {
        "lukas-reineke/cmp-under-comparator",
        --event = {"BufRead", "BufNewFile"},
    },
    {
        'hrsh7th/cmp-path',
        -- --event = {"BufRead", "BufNewFile"},
        after = "nvim-cmp",
    },
    {
        'hrsh7th/cmp-cmdline',
        -- --event = {"BufRead", "BufNewFile"},
        after = "nvim-cmp"
    },
    {
        'hrsh7th/nvim-cmp',
        after = "LuaSnip",
        config = function ()
            require("core.lsp_config.cmp").load()
        end,
    },
    {
        'saadparwaiz1/cmp_luasnip',
        -- --event = {"BufRead", "BufNewFile"},
        after = "nvim-cmp"
    },
    {
        "hrsh7th/cmp-nvim-lua",
        -- --event = {"BufRead", "BufNewFile"},
        after = "nvim-cmp"
        -- --event = "BufRead",

    },
    {
        "weilbith/nvim-code-action-menu",
        --event = {"BufRead", "BufNewFile"},
        -- after = "nvim-lspconfig",
        config = function ()
            require("core.lsp_config.codeactionmenu").load()
        end,
    },
    -- snippets
    {
        "rafamadriz/friendly-snippets",
        -- --event = "BufRead",
        -- --event = "BufEnter",
        -- --event = {"BufRead", "BufNewFile"},
    },
    {
        "L3MON4D3/LuaSnip",
        -- --event = {"BufRead", "BufNewFile"},
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
        -- --event = {"BufRead", "BufNewFile"},
        -- after = "nvim-cmp"
    },
    {
        "honza/vim-snippets",
        -- --event = {"BufRead", "BufNewFile"},
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
    -- {
    --     "rebelot/kanagawa.nvim",
    --     -- --event = "VimEnter",
    --     config = function ()
    --         require("core.theme").load()
    --     end
    --     -- after = "nvim-treesitter"
    -- },
    -- {
    --     "catppuccin/nvim"
    -- },
    {
        "folke/tokyonight.nvim",
        config = function ()
            require("core.theme").load()
        end
    },
}

return plugins
