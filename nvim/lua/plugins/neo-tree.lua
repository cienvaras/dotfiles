return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  keys = {
    { '<leader>ft', '<cmd>Neotree toggle right<cr>', desc = 'Open File explorer' },
    { '<leader>fc', '<cmd>Neotree toggle right reveal<cr>', desc = 'Open File explorer in current directory' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true,
      event_handlers = {
        {
          event = 'file_opened',
          handler = function()
            -- auto close
            require('neo-tree.command').execute({ action = 'close' })
          end
        },
      }
    })
  end
}
