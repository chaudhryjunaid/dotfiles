call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'flazz/vim-colorschemes'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-tmux-navigator'
Plug 'shougo/vimproc.vim'
Plug 'marijnh/tern_for_vim'

call plug#end()

set nu
set laststatus=2

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" NERDCommenter options
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" " Align line-wise comment delimiters flush left instead of following code
" indentation
" let g:NERDDefaultAlign = 'left'

" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


