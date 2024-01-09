local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/andres/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js' }
}

-- dap.configurations.php = {
--   {
--     type = 'php',
--     request = 'launch',
--     name = 'Listen for Xdebug',
--     port = 9003
--   }
-- }

local continue = function()
  if vim.fn.filereadable('.vscode/launch.json') then
    require('dap.ext.vscode').load_launchjs()
  else
    print('No VSCode debugger configuration found.');
  end
  require('dap').continue()
end
vim.keymap.set('n', '<leader>dd', continue)
vim.keymap.set('n', '<leader>dc', '<cmd>Telescope dap commands<cr>')

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- DAP UI
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set('n', '<leader>du', require('dapui').toggle)
