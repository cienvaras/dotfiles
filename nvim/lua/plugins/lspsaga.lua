return {
  'nvimdev/lspsaga.nvim',
  event = 'BufRead',
  config = function()
      require('lspsaga').setup({
        diagnostic = {
          on_insert = false,
          show_code_action = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
        lightbulb = {
          enable = false,
        }
      })
  end,
  dependencies = {
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-treesitter/nvim-treesitter'}
  }
}
