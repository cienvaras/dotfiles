-- {{{ General configuration.

-- configuring LSP servers
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  {text = ' ', texthl = 'LspDiagnosticsSignError'}
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  {text = ' ', texthl = 'LspDiagnosticsSignWarning'}
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  {text = ' ', texthl = 'LspDiagnosticsSignInformation'}
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  {text = '', texthl = 'LspDiagnosticsSignHint'}
)

function on_attach_common(client)
  print("LSP started.");

  local border = {
    {"🭽", "FloatBorder"},
    {"▔", "FloatBorder"},
    {"🭾", "FloatBorder"},
    {"▕", "FloatBorder"},
    {"🭿", "FloatBorder"},
    {"▁", "FloatBorder"},
    {"🭼", "FloatBorder"},
    {"▏", "FloatBorder"},
  }
  -- if client.resolved_capabilities.document_formatting then
  --     vim.cmd [[augroup Format]]
  --     vim.cmd [[autocmd! * <buffer>]]
  --     vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
  --     vim.cmd [[augroup END]]
  -- end

  -- GOTO mappings
  -- map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  -- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  -- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  -- map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  -- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- ACTION mappings
  -- map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  -- map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
  -- map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
  -- map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  -- map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
  -- map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  -- map('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  -- map('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
  vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
  vim.cmd('nnoremap <silent> gr <cmd>Trouble lsp_references<CR>')
  vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
  vim.cmd('nnoremap <silent> <leader>cf <cmd>lua vim.lsp.buf.formatting()<CR>')
  -- vim.cmd('nnoremap <silent> <leader>cr <cmd>Lspsaga rename<CR>')
  -- vim.cmd('nnoremap <silent> <leader>ca :Lspsaga code_action<CR>')
  -- vim.cmd('nnoremap <silent> K :Lspsaga hover_doc<CR>')
  -- vim.cmd('nnoremap <silent> gs <cmd>Lspsaga signature_help<CR>')
  vim.cmd('nnoremap <silent> <leader>cr <cmd>lua vim.lsp.buf.rename()<CR>')
  vim.cmd('nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>')
  vim.cmd('nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>')
  vim.cmd('nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>')
  vim.cmd('nnoremap <silent> <leader>cd <cmd>Trouble lsp_document_diagnostics<CR>')
  -- vim.cmd('nnoremap <silent> <leader>[ :Lspsaga diagnostic_jump_prev<CR>')
  -- vim.cmd('nnoremap <silent> <leader>] :Lspsaga diagnostic_jump_next<CR>')
  vim.cmd('nnoremap <silent> <leader>[ <cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" } })<CR>')
  vim.cmd('nnoremap <silent> <leader>] <cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" } })<CR>')
  -- scroll down hover doc or scroll in definition preview
  -- vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
  -- scroll up hover doc
  -- vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
  vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

  -- Inline diagnostics configuration.
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      underline = true,
      update_in_insert = true
    }
  )
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- }}}

-- {{{ Null-ls config.

require('null-ls').config {}
require('lspconfig')['null-ls'].setup {}

-- }}}

-- {{{ TSServer config.

local function on_attach_tsserver(client)
  on_attach_common(client)
  client.resolved_capabilities.document_formatting = false

  local ts_utils = require('nvim-lsp-ts-utils')

  -- defaults
  ts_utils.setup {
      debug = true,
      disable_commands = false,
      enable_import_on_completion = false,
      import_all_timeout = 5000, -- ms

      -- eslint
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = 'eslint_d',
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = true,

      -- formatting
      enable_formatting = true,
      formatter = 'prettier',
      formatter_config_fallback = nil,

      -- parentheses completion
      complete_parens = false,
      signature_help_in_parens = false,

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
  }

  -- required to fix code action ranges
  ts_utils.setup_client(client)

end

require'lspconfig'.tsserver.setup {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = on_attach_tsserver,
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- on_attach = require'lsp'.common_on_attach,
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    settings = {documentFormatting = false},
    capabilities = capabilities,
    -- handlers = {
    --     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --         -- virtual_text = {spacing = 0, prefix = ""},
    --         virtual_text = false,
    --         -- signs = true,
    --         underline = true,
    --         update_in_insert = true
    --     })
    -- }
}

-- }}}

-- {{{ Intephense config.

require'lspconfig'.intelephense.setup {
  on_attach = on_attach_common,
  capabilities = capabilities,
}

-- }}}

-- {{{ HTML & CSS config.

-- TODO: Confirm this is not needed anymore.
--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- }}}

-- {{{ Python config.

require'lspconfig'.pyright.setup{
  capabilities = capabilities
}

-- }}}
