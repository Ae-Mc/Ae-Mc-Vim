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
set softtabstop=2
tab sball
set switchbuf=useopen
set incsearch
set encoding=utf-8
" Каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

"
"____________=== Настройки python ===___________
"

" Отключаем автокомлит по коду
let g:pymode_rope = 0
let g:pymode_rope_competion = 0
let g:pymode_rope_complet_on_dot = 0

" Проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "W191"
let g:pymode_lint_write = 1  " Проверка кода после сохранения

" Подсветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

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

" Шоткаты для компиляции C/C++ файлов
autocmd filetype c map <F8> :w <CR> :!gcc % && ./a.out <CR>
autocmd filetype cpp map <F8> :w <CR> :!g++ % && ./a.out <CR>

" Шоткат для запуска Python файлов
autocmd filetype python map <F8> :w <CR> :!python3.7 % <CR>
