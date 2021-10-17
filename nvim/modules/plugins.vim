call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Nord Color Scheme.
Plug 'shaunsingh/nord.nvim'
" GitSigns.
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
" Nvim Web Icons.
Plug 'kyazdani42/nvim-web-devicons'
" Nvim-tree.
Plug 'kyazdani42/nvim-tree.lua'
" Lualine.
Plug 'hoob3rt/lualine.nvim'
" Colorizer
Plug 'norcalli/nvim-colorizer.lua'
" Which Key.
Plug 'liuchengxu/vim-which-key'
" Surround.
Plug 'tpope/vim-surround'
" Telescope.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
" LSP.
Plug 'neovim/nvim-lspconfig'
" LSP Trouble
Plug 'folke/trouble.nvim'
" nvim-cmp and friends.
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/cmp-emoji'
" vsnip.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
" LSP Saga.
Plug 'glepnir/lspsaga.nvim'
" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Emmet.
Plug 'mattn/emmet-vim'
" nvim-comment.
Plug 'terrortylor/nvim-comment'
" nvim-autopairs.
Plug 'windwp/nvim-autopairs'
" nvim-ts-autotag.
Plug 'windwp/nvim-ts-autotag'
" Indent Blankline.
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
" vim-twig
Plug 'qbbr/vim-twig'
" nvim-peekup
Plug 'gennaro-tedesco/nvim-peekup'
" vimwiki
Plug 'vimwiki/vimwiki'
" nvim-lsp-ts-utils
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
" null-ls
Plug 'jose-elias-alvarez/null-ls.nvim'
" Oceanic next colorscheme
Plug 'mhartington/oceanic-next'
" buftabline
Plug 'jose-elias-alvarez/buftabline.nvim'
" vim-kitty-navigator.
Plug 'knubie/vim-kitty-navigator'
" Treesitter Playground.
Plug 'nvim-treesitter/playground'
" Tokyo Night.
Plug 'folke/tokyonight.nvim'
" Markdown preview.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Fugitive.
Plug 'tpope/vim-fugitive'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
