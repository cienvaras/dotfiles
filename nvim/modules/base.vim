" Set filetype stuff to on
filetype on
filetype plugin indent on

" Tabstops are 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set nowrap
set hidden
set termguicolors
set title

let mapleader = ' '

set colorcolumn=80,100

" Hybrid line numbers.
set number relativenumber

set list
" set listchars=tab:›\ ,eol:¬,trail:⋅,lead:⋅
set listchars=tab:›\ ,trail:⋅,lead:⋅

set inccommand=split

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set signcolumn=yes:2

set mouse=a

set foldmethod=marker

" Move to the end or beggining of the line in insert mode.
imap <C-A> <C-O>0
imap <C-L> <C-O>$

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move lines
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
