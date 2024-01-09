return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    require('treesitter-context').setup({
      enable = true,
      max_lines = 0,
      multiline_threshold = 1,
    })
  end,
}
