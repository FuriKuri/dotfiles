set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-scala'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" let g:solarized_termcolors=256
syntax enable
" set background=dark
" colorscheme solarized

set macligatures
set guifont=Fira\ Code:h12
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set ts=2
set laststatus=2
set expandtab
set shiftwidth=2

if has('gui_running')
  set guifont=Fira\ Code:h12
endif

nmap <F8> :TagbarToggle<CR>
nmap <F9> :GoRun<CR>
nmap <F10> :GoTest<CR>
