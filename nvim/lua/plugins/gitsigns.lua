return {
  'lewis6991/gitsigns.nvim',
  event = 'BufRead',
  opts = {
    current_line_blame = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      -- Navigation
      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Gitsigns: Next hunk' })

      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Gitsigns: Previous hunk'})

      -- Actions
      vim.keymap.set({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { buffer = bufnr, desc = 'Gitsigns: Stage hunk' })
      vim.keymap.set({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { buffer = bufnr, desc = 'Gitsigns: Reset hunk' })
      vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr, desc = 'Gitsigns: Stage buffer' })
      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr, desc = 'Gitsigns: Undo stage hunk' })
      vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr, desc = 'Gitsigns: Reset Buffer' })
      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = 'Gitsigns: Preview hunk' })
      vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr, desc = 'Gitsigns: Diff file' })
      vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { buffer = bufnr, desc = 'Gitsigns: Diff file against previous version' })
      -- vim.keymap.set('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = bufnr, desc = 'Gitsigns: Select hunk' })
    end,
  }
}
