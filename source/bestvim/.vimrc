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

nmap <C-j> <c-w>j
nmap <C-k> <c-w>k
nmap <C-h> <c-w>h
nmap <C-l> <c-w>l

call vundle#begin()

"@Plugin: vundle
"--------------------------------------------------
Plugin 'VundleVim/Vundle.vim'

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

"@plugin: Yggdroot/indentLine
"--------------------------------------------------
Plugin 'Yggdroot/indentLine'

let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

"@plugin: ryanoasis/vim-webdevicons
"--------------------------------------------------
Plugin 'ryanoasis/vim-webdevicons'

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

"@plugin: nerdtree
"--------------------------------------------------
Plugin 'scrooloose/nerdtree'

let NERDTreeIgnore =['\~$', '\.pyc$', '\.swp$']	"忽略文件类型
let NERDTreeWinSize = 30							"窗口大小
let NERDTreeShowBookmarks = 1
let NERDTreeStatusline = "OUTLINE"

let g:NERDTreeHidden =0
let g:NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-B> :NERDTreeToggle<CR>

"@plugin: nerdcommenter
"--------------------------------------------------
Plugin 'scrooloose/nerdcommenter'

map <C-L> <leader>ci

"@plugin: vim-nerdtree-syntax-highlight
"--------------------------------------------------
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"let g:NERDTreeHighlightFolders = 1
"let g:NERDTreeHighlightFoldersFullName = 1 
"let g:NERDTreeExtensionHighlightColor = {}
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1

"@plugin: jistr/vim-nerdtree-tabs
"--------------------------------------------------
Plugin 'jistr/vim-nerdtree-tabs'

let g:nerdtree_tabs_open_on_console_startup=1

"@plugin: nerdtree-git-plugin
"--------------------------------------------------
Plugin 'Xuyuanp/nerdtree-git-plugin'

"let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = { 
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\ }

call vundle#end()         
filetype plugin indent on   
