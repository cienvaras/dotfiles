return {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  { 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = {'nvim-lua/plenary.nvim'} },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
  {
    'prochri/telescope-all-recent.nvim',
    dependencies = { 'kkharji/sqlite.lua', 'nvim-telescope/telescope.nvim' },
    config = function() require('telescope-all-recent').setup({}) end,
  },
  { 'nvim-telescope/telescope-dap.nvim', dependencies = { 'nvim-telescope/telescope.nvim', 'rcarriga/nvim-dap-ui' } },
  { 'folke/tokyonight.nvim', lazy = true },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim', branch = 'legacy' },
      'folke/neodev.nvim',
    },
  },
  { 'williamboman/mason.nvim', config = function() require('mason').setup() end },
  'jose-elias-alvarez/typescript.nvim',
  'b0o/SchemaStore.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  { 'nvim-treesitter/nvim-treesitter', build = function() require('nvim-treesitter.install').update({ with_sync = true }) end },
  'nvim-treesitter/nvim-treesitter-context',
  { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup({}) end },
  { 'hrsh7th/nvim-cmp', branch = 'main' },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-calc',
  'ray-x/cmp-treesitter',
  'hrsh7th/cmp-emoji',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-cmdline',
  'rafamadriz/friendly-snippets',
  'tpope/vim-fugitive',
  { 'Tummetott/unimpaired.nvim', config = function() require('unimpaired').setup() end },
  { 'sindrets/diffview.nvim', event = 'VeryLazy', dependencies = { { 'nvim-lua/plenary.nvim' } } },
  { 'kylechui/nvim-surround', event='VeryLazy', config = function() require('nvim-surround').setup({}) end },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'windwp/nvim-ts-autotag',
  'JoosepAlviste/nvim-ts-context-commentstring',
  { 'lalitmee/cobalt2.nvim', dependencies = 'tjdevries/colorbuddy.nvim', lazy = true },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', opt = true } },
  'onsails/lspkind.nvim',
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  'saadparwaiz1/cmp_luasnip',
  { 'rmehri01/onenord.nvim', lazy = true },
  { 'rose-pine/neovim', name = 'rose-pine', lazy = true },
  { 'EdenEast/nightfox.nvim', lazy = true },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { 'yorickpeterse/nvim-pqf', event = 'VeryLazy', config = function() require('pqf').setup() end },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({})
    end
  },
  {
    'creativenull/efmls-configs-nvim',
    version = 'v1.x.x',
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' }, config = function() require('dapui').setup() end },
  { 'theHamsta/nvim-dap-virtual-text', dependencies = { 'mfussenegger/nvim-dap' }, config = function() require('nvim-dap-virtual-text').setup() end },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    version = '^1.0.0',
    config = function()
      require('kitty-scrollback').setup()
    end,
  }
}
