call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'zxqfl/tabnine-vim'
Plug 'itchyny/lightline.vim'
" Plug 'frazrepo/vim-rainbow'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'ycm-core/YouCompleteMe'
" Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'wadackel/vim-dogrun'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'dracula/vim'
Plug 'dbeniamine/todo.txt-vim'

call plug#end()

filetype plugin indent on

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" setting horizontal and vertical splits
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" todo.txt-vim
:let LocalLeader="\\"
let g:Todo_fold_char='+'

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Setting up indendation
au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufNewFile, BufRead *.js, *.html, *.css, *.vue
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" setting up line numbering
set nu

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1

" Rainbow bracket settings
" let g:rainbow_active = 1
let g:vim_vue_plugin_load_full_syntax = 1

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" " show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" " when indenting with '>', use 2 spaces width
set shiftwidth=2
set laststatus=2

""""" enable 24bit true color
if (has("termguicolors"))
 set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax enable
colorscheme dracula
let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ }
" hi Folded guibg=#181818
" hi FoldColumn guibg=#181818
