--[[
    This is for masking the plugins
    type should be PROPERTY.MASK
    mask_type could be "GROUPS" or "PLUGINS"
]]

local PROPERTY = api_o_const.PROPERTY

return {
    {
        type = PROPERTY.MASK,
        mask_type = "GROUPS",
        config = {
            -- "THEME"
        }
    },
    {
        type = PROPERTY.MASK,
        mask_type = "PLUGINS",
        config = {
            -- "rmagatti/session-lens",
            -- "rmagatti/auto-session",
            -- "neoclide/coc.nvim",
            -- "numToStr/Comment.nvim",
            -- "glepnir/dashboard-nvim",
            -- "glepnir/galaxyline.nvim",
            -- "lewis6991/gitsigns.nvim",
            -- "phaazon/hop.nvim",
            -- "anuvyklack/hydra.nvim",
            -- "ziontee113/icon-picker.nvim",
            -- "lukas-reineke/indent-blankline.nvim",
            -- "nvim-neo-tree/neo-tree.nvim",
            -- "https://gitlab.com/yorickpeterse/nvim-window.git",
            -- "famiu/bufdelete.nvim",

            -- "rcarriga/nvim-notify",

            -- "tpope/vim-fugitive",
            -- "kyazdani42/nvim-web-devicons",
            -- "sharkdp/fd",
            -- "romgrk/fzy-lua-native",
            -- "BurntSushi/ripgrep",
            -- "skywind3000/asynctasks.vim",
            -- "skywind3000/asyncrun.vim",
            -- "luukvbaal/stabilize.nvim",
            -- "ethanholz/nvim-lastplace",

            -- "lewis6991/impatient.nvim",
            -- "rafamadriz/friendly-snippets",
            -- "honza/vim-snippets",
            -- "dstein64/vim-startuptime",
            -- "notjedi/nvim-rooter.lua",
            -- "tpope/vim-surround",
            -- "jghauser/mkdir.nvim",
            -- "luochen1990/rainbow",
            -- "AndrewRadev/switch.vim",
            -- "nanozuki/tabby.nvim",

            -- "nvim-telescope/telescope.nvim",
            -- "folke/tokyonight.nvim",
            -- "akinsho/toggleterm.nvim",
            -- "nvim-treesitter/nvim-treesitter",
            -- "nvim-treesitter/nvim-treesitter-textobjects",
            -- "kevinhwang91/nvim-ufo",
            -- "jbyuki/venn.nvim",
            -- "folke/which-key.nvim",
        }
    }
}
