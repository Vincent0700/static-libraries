filetype off
syntax enable			
syntax on

set nocompatible		
set encoding=UTF-8
set number
set ruler
set showmatch
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

"@Plugin: vundle
"--------------------------------------------------
Plugin 'VundleVim/Vundle.vim'

call vundle#end()         
filetype plugin indent on   

"@plugin: gruvbox
"--------------------------------------------------
Plugin 'morhetz/gruvbox'

set bg=dark                     "设置背景为黑色
colorscheme gruvbox             "设置主题为 gruvbox
set guioptions=                 "去掉两边的scrollbar
set guifont=Monaco:h17          "设置字体和字的大小

"@plugin: airline                                                                    
"--------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1

"@plugin: minimap
"--------------------------------------------------
Plugin 'severin-lemaignan/vim-minimap'

map <C-M> :MinimapToggle<CR>

"@plugin: nerdtree
"--------------------------------------------------
Plugin 'scrooloose/nerdtree'

let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']	"忽略文件类型
let NERDTreeWinSize=30							"窗口大小

map <C-B> :NERDTreeToggle<CR>

"@plugin: nerdcommenter
"--------------------------------------------------
Plugin 'scrooloose/nerdcommenter'

map <F4> <leader>ci <CR>

"@plugin: nerdcommenter
"--------------------------------------------------
Plugin 'Yggdroot/indentLine'

let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

