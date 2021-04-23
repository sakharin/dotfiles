"""" Create an undo directory in ~/.vim
if has('persistent_undo')
  set undofile                 "turn on the feature
  set undolevels=5000          "save lots of history
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

set nocompatible              " required
filetype off                  " required

" Enable syntax highlighting
syntax on

" Turn on line number.
set nu
" Set cursor line.
set cul
" Set command line to 2 lines.
set cmdheight=2
" Highlighting search
set hlsearch
" Searches as you type
set incsearch
" Automatically set indent of new line
set autoindent
set smartindent
" UTF-8 support
set encoding=utf-8

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
match BadWhitespace /\s\+$/

" Set ,e to open file in same directory of editing file.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" Dark theme
Plugin 'jnurmine/Zenburn'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Plugin config

" Color
colorscheme zenburn

" Leader
let mapleader = ","

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<cr>
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>vim :tabedit $MYVIMRC<cr>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Set backup directory
set backupdir=$HOME/.vimbk
set directory=$HOME/.vimbk

" Enable folding
map + v%zf

" Show vertical line at column 80
set colorcolumn=80
