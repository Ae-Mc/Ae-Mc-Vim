set nocompatible                        " be iMproved, required
filetype off                            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('path/to/plugins')
Plugin 'VundleVim/Vundle.vim'

"—————————===Code/project navigation===—————————
Plugin 'scrooloose/nerdtree'            " project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser

"——————————————————===Other===——————————————————
Plugin 'vim-airline/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fisadev/FixedTaskList.vim'      " Pending task list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more

"————————————===Snippets support===—————————————
Plugin 'garbas/vim-snipmate'            " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
Plugin 'tomtom/tlib_vim'                " dependencies #2
Plugin 'honza/vim-snippets'             " snippets repo

"———————————===Languages support===—————————————
" ——— Python ———
Plugin 'klen/python-mode'               " Python mode (docs, highlighting, lints, refactor, tun, ipdb and more)
Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
call vundle#end()
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
"
" ==============================================
" =              General Settings
" ==============================================
"
set shiftwidth=2
set noexpandtab
set tabstop=2
tab sball
set switchbuf=useopen
set incsearch
set encoding=utf-8
" Каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"
"
"———————————=== Interface Settings===———————————
"
colorscheme molokai
set cursorline
set number
set novisualbell
set hlsearch
syntax on

" Настройки Vim-Airline
set laststatus=2
let g:airline_theme = 'badwolf'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Настройки TagBar
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0

" Настройки NERDTree
map <F3> :NERDTreeToggle<CR>
" Игнорируем файлы с расширениями
let NERDTreeIgnore=["\~$", "\.pyc$", "\.pyo$", "\.o"]

au BufRead,BufNewFile *.py set noexpandtab
au BufRead,BufNewFile *.py set tabstop=2
au BufRead,BufNewFile *.py set shiftwidth=2

" Шоткаты для компиляции C/C++ файлов
autocmd filetype c map <F8> :w <CR> :!gcc % && ./a.out <CR>
autocmd filetype cpp map <F8> :w <CR> :!g++ % && ./a.out <CR>
