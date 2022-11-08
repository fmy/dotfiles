vim.cmd[[packadd packer.nvim]]

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  -- visualization
  use 'unblevable/quick-scope' -- show f/F target
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- git
  use 'tpope/vim-fugitive' -- Gstatusなど
  use 'tpope/vim-rhubarb' -- Gbrowse
  use 'airblade/vim-gitgutter'
  use 'ruanyl/vim-gh-line'
  -- search
  use 'ibhagwan/fzf-lua'
  use 'godlygeek/tabular'
  use 'kana/vim-textobj-user'
  use 'kana/vim-operator-user'
  use 'kana/vim-operator-replace'
  use 'osyo-manga/vim-textobj-multiblock'
  -- completion
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"
  use 'hrsh7th/vim-vsnip-integ'

  -- use 'github/copilot.vim'
  use 'sbdchd/neoformat'

  -- edit
  -- use 'cohama/lexima.vim' -- 閉じカッコなど
  use 'machakann/vim-sandwich' -- sa/sd/sr
  use 'tpope/vim-commentary' -- gc/gccでコメントをトグル
  use 'mbbill/undotree' -- <Space>u
  use 'terryma/vim-expand-region'
  use 'terryma/vim-multiple-cursors' -- C-n
  -- languages / lint
  use 'editorconfig/editorconfig-vim'
  use 'pangloss/vim-javascript'
  use 'maxmellon/vim-jsx-pretty'
  -- use 'fatih/vim-go'
  -- use 'zah/nim.vim'
  -- use 'elmcast/elm-vim'
  use 'HerringtonDarkholme/yats.vim'
  use 'janko/vim-test'
  -- use 'benekastah/neomake'
  -- use 'benjie/neomake-local-eslint.vim'
  use 'hashivim/vim-terraform'
  -- others
  use 'mattn/webapi-vim'
end
})
