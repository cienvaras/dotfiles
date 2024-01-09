-- Neovim base settings.

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.cursorline = true
-- vim.opt.listchars = { tab = '→ ', trail = '⋅', multispace = '⋅', eol = '↵' }
vim.opt.listchars = { tab = '→ ', trail = '⋅', eol = '↵' }
vim.opt.list = true
vim.opt.signcolumn = 'yes:2'
vim.wo.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 999
vim.opt.hlsearch = false
vim.opt.mouse  = 'a'
vim.opt.breakindent = true
vim.opt.completeopt = 'menu,menuone,noselect'
-- Use rg. See https://www.reddit.com/r/neovim/comments/sfg8d3/need_help_some_questions_about_using_ripgrep_in/
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.opt.clipboard = 'unnamedplus'

-- Leader.
vim.g.mapleader = ' '

-- Node.js version.
local node_version = '18.13.0'
local node_path = os.getenv('NVM_DIR') .. '/versions/node/v' .. node_version .. '/bin'
vim.cmd("let $PATH = \'" .. node_path .. ":' . $PATH")
vim.g.node_host_prog = node_path .. '/neovim-node-host'

-- Autocmds

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = 'normal zxzR',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 700 })
  end,
})

-- Enable kitty ligatures on start.
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     if os.getenv('TERM') == 'xterm-kitty' then
--       vim.fn.jobstart('kitty @ disable-ligatures never', { detach = true })
--     end
--   end
-- })

-- Enable kitty ligatures on start.
-- vim.api.nvim_create_autocmd('VimLeave', {
--   callback = function()
--     if os.getenv('TERM') == 'xterm-kitty' then
--       vim.fn.jobstart('kitty @ disable-ligatures always', { detach = true })
--     end
--   end
-- })

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local types_no_colorcolumn = {
      'fugitive',
      'TelescopePrompt',
      'TelescopeResults',
      'qf',
      'dap-repl',
      'dapui_console',
      'dapui_watches',
      'dapui_stacks',
      'dapui_breakpoints',
      'dapui_scopes',
    }
    local current_type = vim.fn.expand('<amatch>')
    local match = false
    for i = 1, #types_no_colorcolumn do
      if types_no_colorcolumn[i] == current_type then
        vim.schedule(function()
          print('Match!')
        end)
        match = true
        break
      end
    end
    if not match then
      vim.wo.colorcolumn = '80,100'
    else
      vim.wo.colorcolumn = ''
    end
  end,
})

-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*',
--   callback = function()
--     if vim.bo.buftype ~= 'nowrite' then
--       vim.bo.colorcolumn = '80,100'
--     end
--   end,
-- })
