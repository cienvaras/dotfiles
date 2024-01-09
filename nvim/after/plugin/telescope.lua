-- Telescope settings.
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = require('telescope.themes').get_ivy({
    dynamic_preview_title = true,
    layout_config = {
      preview_cutoff = 140,
    },
    path_display = {
      truncate = 3,
    },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
      },
      n = {
        ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  }),
  pickers = {
    buffers = {
      theme = 'dropdown',
      previewer = false,
      mappings = {
        i = {
          ['<C-w>'] = 'delete_buffer',
        },
      },
      sort_lastused = true,
      sort_mru = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')

-- Keybindings.
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind with [G]rep' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
