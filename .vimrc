filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'mattn/emmet-vim'
Plugin 'dense-analysis/ale'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'zxqfl/tabnine-vim'
Plugin 'itchyny/lightline.vim'
" Plugin 'frazrepo/vim-rainbow'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'
Plugin 'ycm-core/YouCompleteMe'
" Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'wadackel/vim-dogrun'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" setting horizontal and vertical splits
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Rainbow bracket settings
let g:rainbow_active = 1
let g:vim_vue_plugin_load_full_syntax = 1
let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ }

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" " show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" " when indenting with '>', use 2 spaces width
set shiftwidth=2

colorscheme dogrun
set laststatus=2
