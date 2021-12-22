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
    -- 括号补全
    'windwp/nvim-autopairs'
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
  {'ggandor/lightspeed.nvim'},
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
    'glepnir/indent-guides.nvim'
  },
  {
    'neovim/nvim-lspconfig'
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
  --lsp
  {
    'apple/sourcekit-lsp'
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

-- return require('packer').startup(function(use)
--   -- Packer can manage itself
--   use 'wbthomason/packer.nvim'

--   -- Simple plugins can be specified as strings
--   use '9mm/vim-closer'

--   -- Lazy loading:
--   -- Load on specific commands
--   use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

--   -- Load on an autocommand event
--   use {'andymass/vim-matchup', event = 'VimEnter'}

--   -- Load on a combination of conditions: specific filetypes or commands
--   -- Also run code after load (see the "config" key)
--   use {
--     'w0rp/ale',
--     ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--     cmd = 'ALEEnable',
--     config = 'vim.cmd[[ALEEnable]]'
--   }

--   -- Plugins can have dependencies on other plugins
--   use {
--     'haorenW1025/completion-nvim',
--     opt = true,
--     requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
--   }

--   -- Plugins can also depend on rocks from luarocks.org:
--   use {
--     'my/supercoolplugin',
--     rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
--   }

--   -- You can specify rocks in isolation
--   use_rocks 'penlight'
--   use_rocks {'lua-resty-http', 'lpeg'}

--   -- Local plugins can be included
--   use '~/projects/personal/hover.nvim'

--   -- Plugins can have post-install/update hooks
--   use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

--   -- Post-install/update hook with neovim command
--   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

--   -- Post-install/update hook with call of vimscript function with argument
--   use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

--   -- Use specific branch, dependency and run lua file after load
--   use {
--     'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
--     requires = {'kyazdani42/nvim-web-devicons'}
--   }

--   -- Use dependency and run lua function after load
--   use {
--     'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
--     config = function() require('gitsigns').setup() end
--   }

--   -- You can specify multiple plugins in a single call
--   use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

--   -- You can alias plugin names
--   use {'dracula/vim', as = 'dracula'}

--   -- dashboard
--   use {'glepnir/dashboard-nvim', disable = false, as = 'dashboard'}
-- end)
