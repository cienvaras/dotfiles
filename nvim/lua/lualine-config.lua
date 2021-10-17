require('lualine').setup {
  options = {
    theme = 'tokyonight',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_c = {
      'filename',
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {error = ' ', warn = ' ', info = ' '},
      },
    },
    lualine_x = {
      'filetype',
    }
  },
  extensions = {'nvim-tree'},
}

