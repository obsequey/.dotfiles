" Could be used everywhere else
filetype off
set hlsearch
set ignorecase
set incsearch
set noswapfile
let mapleader = "'" " remap the leader to ''', right next to '1'
inoremap jk <ESC>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
syntax on
" setting up line numbering
set nu

call plug#begin('~/.vim/plugged')
Plug 'ericbn/vim-solarized'
" Plug 'altercation/vim-colors-solarized'
Plug 'luochen1990/rainbow'
Plug 'pangloss/vim-javascript'
Plug 'arzg/vim-colors-xcode'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'cormacrelf/dark-notify'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'jaredgorski/SpaceCamp'
Plug 'scrooloose/nerdtree'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'zxqfl/tabnine-vim'
Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
" Plug 'itchyny/lightline.vim'
" Plugin 'frazrepo/vim-rainbow'
Plug 'davidhalter/jedi-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'NLKNguyen/papercolor-theme'
" Plugin 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
" Plug 'wadackel/vim-dogrun'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on

" setting horizontal and vertical splits
set splitbelow
set splitright

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:python3_host_prog = "/usr/bin/python3"
" let g:python_host_prog = 0

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.js,*.rs,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Rainbow bracket settings
let g:rainbow_active = 1
let g:vim_vue_plugin_load_full_syntax = 1

filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
" set textwidth=80
set fileformat=unix

set termguicolors
colorscheme one
let g:airline_theme='one'
set cursorline
set bg=dark

:lua <<EOF
require('dark_notify').run()
EOF

set laststatus=2
set statusline+=%F
set title

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': [ 'pylint' ]
      \}

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif
