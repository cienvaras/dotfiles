-- LSP Saga config.
require('lspsaga').init_lsp_saga {
  error_sign = ' ',
  warn_sign = ' ',
  hint_sign = '',
  infor_sign = ' ',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = false,
  },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}
}

-- vim.cmd("nnoremap <silent> gh :Lspsaga lsp_finder<CR>")
-- vim.cmd("nnoremap <silent><leader>a :Lspsaga code_action<CR>")
-- vim.cmd("vnoremap <silent><leader>a :<C-U>Lspsaga range_code_action<CR>")
-- vim.cmd("nnoremap <silent>K :Lspsaga hover_doc<CR>")
-- vim.cmd("nnoremap <silent> gs :Lspsaga signature_help<CR>")
-- vim.cmd("nnoremap <silent>gr :Lspsaga rename<CR>")
-- vim.cmd("nnoremap <silent> gd :Lspsaga preview_definition<CR>")
-- vim.cmd("nnoremap <silent> <leader>dd :Lspsaga show_line_diagnostics<CR>")
-- vim.cmd("nnoremap <silent><leader>dc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")
-- vim.cmd("nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>")
-- vim.cmd("nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>")

