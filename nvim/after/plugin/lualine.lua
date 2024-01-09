local function lspsaga_winbar()
  return require('lspsaga.symbolwinbar'):get_winbar() or ''
end

require('lualine').setup({
  options = {
    globalstatus = true,
    section_separators = '',
    component_separators = '',
    disabled_filetypes = {
      winbar = {
        'fugitive',
        'neo-tree',
        'dap-repl',
        'dapui_console',
        'dapui_watches',
        'dapui_stacks',
        'dapui_breakpoints',
        'dapui_scopes',
      },
    },
  },
  sections = {
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        symbols = {error = ' ', warn = ' ', info = ' '},
      },
    },
    lualine_x = {
      'filetype',
    }
  },
  winbar = {
    lualine_a = {lspsaga_winbar},
    lualine_z = {'filename'},
  },
  inactive_winbar = {
    lualine_z = {'filename'},
  },
  -- extensions = { 'fugitive', 'lazy', 'mason', 'nvim-dap-ui', 'quickfix' },
})
