" Plug configuration.
source ~/.config/nvim/modules/plugins.vim

" Base config.
source ~/.config/nvim/modules/base.vim

" Colorscheme config.
lua require('colorscheme')

" LSP Config.
lua require('lsp-config')
"
" LSP Saga
" lua require('lspsaga-config')

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" nvim-tree config.
source ~/.config/nvim/modules/nvim-tree-config.vim

" lualine config.
lua require('lualine-config')

" Colorizer
lua require'colorizer'.setup()

" Git Signs config.
lua require('gitsigns-config')

" nvim-comment config.
lua require('nvim_comment').setup()

" Which Key config.
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" Telescope base config.
lua << EOF
require'telescope'.setup {
  defaults = {
    layout_strategy = 'vertical',
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ['<C-w>'] = 'delete_buffer',
        }
      }
    }
  }
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nvim-cmp config.
lua << EOF
vim.o.completeopt = 'menu,menuone,noselect'

local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    -- For vsnip user.
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'treesitter' },
    { name = 'emoji' },
  }
}
EOF

" Treesitter config.
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
EOF

" nvim-autopairs configuration.
lua << EOF
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local remap = vim.api.nvim_set_keymap
npairs.setup({
  -- check_ts = true,
})

-- cmp integration.
require('nvim-autopairs.completion.cmp').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
-- TODO: Delete this after make sure it's not needed anymore.
-- npairs.add_rule(
--   Rule(">", "<",
--     { 'html', 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'svelte', 'vue', 'xml'})
--     :only_cr()
-- 
-- )
EOF



let g:indent_blankline_char = '│'
" let g:indent_blankline_space_char = '·'
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_buftype_exclude = ['terminal', 'nofile', 'help']
autocmd BufEnter * hi IndentBlanklineChar guifg=#3b4252

nnoremap <leader>bd <cmd>bdelete<cr>

let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]

" buftabline
" lua << EOF
" require("buftabline").setup {
"   icons = true,
" }
" EOF

" vim-kitty-navigator.
let g:kitty_navigator_no_mappings = 1

nnoremap <silent> <C-h> :KittyNavigateLeft<cr>
nnoremap <silent> <C-j> :KittyNavigateDown<cr>
nnoremap <silent> <C-k> :KittyNavigateUp<cr>
nnoremap <silent> <C-l> :KittyNavigateRight<cr>

au BufRead,BufNewFile *.graphql setfiletype graphql

" Highlight yank
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" Configuration helpers.
lua << EOF
function search_dotfiles()
  require('telescope.builtin').find_files({
    prompt_title = 'NVIM Config files',
    cwd = '~/.config/nvim/',
    layout_strategy = 'vertical'
  })
end
EOF

nnoremap <silent> <leader>sf <cmd>lua search_dotfiles()<cr>
nnoremap <silent> <leader>sr <cmd>source ~/.config/nvim/init.vim<cr>

" vsnip.
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
