set nocompatible                        " be iMproved, required
filetype off                            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('path/to/plugins')
Plugin 'VundleVim/Vundle.vim'

"—————————===Code/project navigation===—————————
Plugin 'majutsushi/tagbar'               " Class/module browser

"——————————————————===Other===——————————————————
Plugin 'vim-airline/vim-airline'         " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fisadev/FixedTaskList.vim'       " Pending task list
Plugin 'rosenfeld/conque-term'           " Consoles as buffers
Plugin 'tpope/vim-surround'              " Parentheses, brackets, quotes, XML tags, and more
Plugin 'ycm-core/YouCompleteMe'          " Autocomplete plugin
Plugin 'vim-syntastic/syntastic'         " Check syntax on each save
Plugin 'kien/ctrlp.vim'                  " Search in current dirrectory with Ctrl-P
Plugin 'Yggdroot/indentLine'             " Displaying thin vertical lines at each indentation level
Plugin 'ludovicchabant/vim-gutentags'    " Auto tags

"————————————===Snippets support===—————————————
Plugin 'garbas/vim-snipmate'             " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'    " dependencies #1
Plugin 'tomtom/tlib_vim'                 " dependencies #2
Plugin 'honza/vim-snippets'              " snippets repo

"———————————===Languages support===—————————————
" ——— Python ———
Plugin 'vim-scripts/indentpython.vim'    " Improved autoindentation for python
Plugin 'nvie/vim-flake8'                 " PEP 8 checking
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
set wrap
set noexpandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
tab sball
set switchbuf=useopen
set incsearch
set encoding=utf-8
" Каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

"
"___________=== Настройки syntastic===__________
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_agregate_errors = 1

"
"____________=== Настройки python ===___________
"

" Подсветка кода
let python_highlight_all = 1
" Проврка синтаксиса осуществляется через mypy
let g:syntastic_python_checkers = ['flake8', 'mypy']

" Устанавливаем свою длину табуляции и подсветка 80 столбца в каждой строке
autocmd filetype python set expandtab
      \ shiftwidth=4
      \ tabstop=4
      \ softtabstop=4
      \ colorcolumn=80

"
"———————————=== Interface Settings===———————————
"
colorscheme molokai
set cursorline       " Выделить строку, на которой находится курсор
set number           " Показать номера строк
set novisualbell
set hlsearch         " Включить подсветку при поиске
set splitright       " При использовании vsplit новый файл будет открываться справа
set splitbelow       " При использовании split новый файл будет открываться снизу
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

" Настройки indentLine
let g:indentLine_char = '┊'

" Настройки NERDTree
"map <F3> :NERDTreeToggle<CR>
" Игнорируем файлы с расширениями
"let NERDTreeIgnore=["\~$", "\.pyc$", "\.pyo$", "\.o"]

" Шоткаты для компиляции C/C++ файлов
autocmd filetype c map <F8> :w <CR> :!gcc % && ./a.out <CR>
autocmd filetype cpp map <F8> :w <CR> :!g++ % && ./a.out <CR>

" Шоткат для запуска Python файлов
autocmd filetype python map <F8> :w <CR> :!python3.7 % <CR>

" Для нормального  отображения *.asm файлов на языке nasm
autocmd filetype asm set ft=nasm
