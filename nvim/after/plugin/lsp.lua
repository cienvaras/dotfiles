-- LSP Configuration.

-- Fidget.
require('fidget').setup()

-- Signs.
vim.fn.sign_define(
  'DiagnosticSignError',
  { text = ' ', texthl = 'DiagnosticSignError' }
)
vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = ' ', texthl = 'DiagnosticSignWarn' }
)
vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = ' ', texthl = 'DiagnosticSignInfo' }
)
vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'DiagnosticSignHint' }
)

-- Diagnostic configuration.
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'efm'
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local set_auto_formatting = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      lsp_formatting(bufnr)
    end,
  })
end

-- Add border to LSP windows.
require('lspconfig.ui.windows').default_options.border = 'single'

-- Common tasks for all languages.
local on_attach_common = function(client, bufnr)
  -- print('LSP started.');

  -- local border = {
  --   {'🭽', 'FloatBorder'},
  --   {'▔', 'FloatBorder'},
  --   {'🭾', 'FloatBorder'},
  --   {'▕', 'FloatBorder'},
  --   {'🭿', 'FloatBorder'},
  --   {'▁', 'FloatBorder'},
  --   {'🭼', 'FloatBorder'},
  --   {'▏', 'FloatBorder'},
  -- }
  --
  -- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  -- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  --   opts = opts or {}
  --   opts.border = opts.border or border
  --   return orig_util_open_floating_preview(contents, syntax, opts, ...)
  -- end

  -- LSP specific keymaps.
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
  vim.keymap.set('n', '<leader>cf', function() return vim.lsp.buf.format({ async = true }) end, { desc = '[C]ode [F]ormat' })
  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[C]ode [R]ename' })
  vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', { desc = '[C]ode [A]ction' })
  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { desc = 'Hover Documentation' })
  vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })
  vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', { desc = 'Goto previous diagnostic' })
  vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', { desc = 'Goto next diagnostic' })
  vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<cr>', { desc = '[G]oto [R]eferences' })
  vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
  vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
  vim.keymap.set('n', '<leader>cd',vim.diagnostic.setqflist, { desc = '[C]ode [D]iagnostics' })
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc =  '[W]orkspace [R]emove Folder' })
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = '[W]orkspace [L]ist Folders' })
  vim.keymap.set('n', '<leader>co', '<cmd>Lspsaga outline<cr>', { desc = '[C]ode [O]utline' })

  -- Formatting.
  if client.supports_method('textDocument/formatting') then
    set_auto_formatting(bufnr);
  end
end

vim.api.nvim_create_user_command(
  'AutoFormattingDisable',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = vim.api.nvim_get_current_buf() })
  end,
  { desc = 'Disable auto formatting on current buffer' }
)

vim.api.nvim_create_user_command(
  'AutoFormattingEnable',
  function()
    set_auto_formatting(vim.api.nvim_get_current_buf())
  end,
  { desc = 'Enable auto formatting for current buffer' }
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Typescript config.
require('lspconfig').tsserver.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      function()
        vim.lsp.buf.execute_command({
          command = '_typescript.organizeImports',
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = '',
        })
      end,
      description = 'Organize Imports',
    }
  }
})

-- Null-ls config.
-- require('null-ls').setup({
--   sources = {
--     require('null-ls').builtins.formatting.prettierd,
--     require('null-ls').builtins.diagnostics.eslint_d,
--     require('typescript.extensions.null-ls.code-actions'),
--     require('null-ls').builtins.diagnostics.phpcs.with({
--       filetypes = { 'php', 'module' },
--       args = { '--standard=Drupal', '--report=json', '-q', '-s', '--runtime-set', 'ignore_warnings_on_exit', '1', '--runtime-set', 'ignore_errors_on_exit', '1', '-', },
--     }),
--   },
-- })

-- Intelephense config.
require('lspconfig').intelephense.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
})

-- HTML & CSS config.
require('lspconfig').html.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
  filetypes = { 'html', 'twig' },
})

require('lspconfig').cssls.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
})

-- Python config.
require('lspconfig').pyright.setup({
  on_attach = on_attach_common,
  capabilities = capabilities
})

-- Rust config.
require('lspconfig').rust_analyzer.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
})

-- Yaml config.
require('lspconfig').yamlls.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require('schemastore').json.schemas({
        select = {
          'CircleCI config.yml',
          'GitHub Workflow',
        },
      }),
    },
  },
})

-- JSON config.
require('lspconfig').jsonls.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas({
        select = {
          '.eslintrc',
          'package.json',
          'prettierrc.json',
          'tsconfig.json',
        },
      }),
    },
  },
})

-- Astro config.
require('lspconfig').astro.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
})

-- Lua config.
require('lspconfig').lua_ls.setup({
  on_attach = on_attach_common,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Tailwind CSS config.
require('lspconfig').tailwindcss.setup({
  on_attach = on_attach_common,
  capabilities = capabilities,
})

-- Emmet-ls config.
local emmetCapabilites = vim.lsp.protocol.make_client_capabilities()
emmetCapabilites.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = emmetCapabilites,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'twig' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ['bem.enabled'] = true,
        },
      },
    }
})

-- EFM config.
-- Register linters and formatters per language
local eslint = require('efmls-configs.linters.eslint')
local prettier = require('efmls-configs.formatters.prettier')
local php = require('efmls-configs.linters.php')
local phpcbf = require('efmls-configs.formatters.phpcbf')
local phpcs = {
  prefix = 'phpcs',
  lintSource = 'efm/phpcs',
  lintCommand = 'phpcs --no-colors --report=emacs --standard=Drupal -',
  lintStdin = true,
  lintFormats = { '%.%#:%l:%c: %trror - %m', '%.%#:%l:%c: %tarning - %m' },
  rootMarkers = { '.phpcs.xml', 'phpcs.xml', '.phpcs.xml.dist', 'phpcs.xml.dist', 'composer.json' },
}
-- local stylua = require('efmls-configs.formatters.stylua')
local languages = {
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  php = { php, phpcbf, phpcs },
  -- lua = { stylua },
}

-- Or use the defaults provided by this plugin
-- check doc/SUPPORTED_LIST.md for the supported languages
--
-- local languages = require('efmls-configs.defaults').languages()

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
  on_attach = on_attach_common,
  capabilities = capabilities,
}))
