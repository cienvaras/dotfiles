return {
  'L3MON4D3/LuaSnip',
  version = '1.*',
  build = 'make install_jsregexp',
  keys = {
    {
      '<Tab>',
      function()
        local luasnip = require('luasnip')
        if luasnip.expand_or_jumpable() then
          luasnip.jump(1)
        else
          local tab = vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
          vim.api.nvim_feedkeys(tab, 'n', true)
        end
      end,
      mode = { 'i', 's' },
      desc = 'Jump to next snippet position',
    },
    {
      '<S-Tab>',
      function()
        local luasnip = require('luasnip')
        if luasnip.expand_or_jumpable() then
            luasnip.jump(-1)
        else
          local stab = vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true)
          vim.api.nvim_feedkeys(stab, 'n', true)
        end
      end,
      mode = { 'i', 's' },
      desc = 'Jump to previous snippet position',
    },
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
