return {
  'rlane/pounce.nvim',
  cmd = { 'Pounce', 'PounceRepeat' },
  keys = {
    { 's', '<cmd>Pounce<cr>', desc = 'Trigger Pounce' },
    { 'S', '<cmd>PounceRepeat<cr>', desc = 'Repeat last Pounce search' },
    { 's', '<cmd>Pounce<cr>', mode = 'v', desc = 'Trigger Pounce (visual mode)' },
    { 'gs', '<cmd>Pounce<cr>', mode = 'o', desc = 'Trigger Pounce (operator-pending mode)' },
  },
}
