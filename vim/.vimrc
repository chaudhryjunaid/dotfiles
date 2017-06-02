" Don't try to be vi compatible
set nocompatible

" Baseline
set encoding=utf-8
scriptencoding utf-8

" Helps force plugins to load correctly when it is turned back on below
filetype off
function! InstallLinters(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g jshint eslint babel-eslint
  endif
endfunction
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !brew install cmake
    !./install.py --tern-completer --clang-completer
  endif
endfunction
function! InstallEditorConfig(info)
  if a:info.status == 'installed' || a:info.force
    !brew install editorconfig
  endif
endfunction
function! InstallJSBeautify(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g js-beautify
  endif
endfunction
function! InstallSilverSearcher(info)
  if a:info.status == 'installed' || a:info.force
    !brew install the_silver_searcher
  endif
endfunction
function! MakeVimProc(info)
  if a:info.status == 'installed' || a:info.force
    !make
  endif
endfunction





call plug#begin('~/.vim/plugged')

Plug 'djoshea/vim-autoread'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic', { 'do': function('InstallLinters') }
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }
Plug 'valloric/youcompleteme', { 'do': function('BuildYCM') }
Plug 'pangloss/vim-javascript'
"Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim', { 'do': function('InstallSilverSearcher') }
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-tmux-navigator'
Plug 'shougo/vimproc.vim', { 'do': function('MakeVimProc') }
Plug 'jelera/vim-javascript-syntax' " Additional JS syntax highlighting
Plug 'plasticboy/vim-markdown' "Markdown support
Plug 'burnettk/vim-angular' " Angular functionality
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair
"For JavaScript development
Plug 'moll/vim-node' " Node js
Plug 'groenewege/vim-less' " Less syntax
Plug 'othree/javascript-libraries-syntax.vim' " Javascript syntax library highlighting
Plug 'othree/jspc.vim' " Javascript parameter completion
Plug '1995eaton/vim-better-javascript-completion' " Expansion of vim's javascript
Plug 'https://github.com/altercation/vim-colors-solarized.git' " solarized colorscheme

Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'gorodinskiy/vim-coloresque'
Plug 'wavded/vim-stylus'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim', { 'do': function('InstallEditorConfig') }
Plug 'chiel92/vim-autoformat', { 'do': function('InstallJSBeautify') }
Plug 'mhartington/oceanic-next'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Turn on syntax highlighting
syntax on
"colorscheme OceanicNext

"let g:airline_theme='oceanicnext'
let g:enable_bold_font = 1

set background=dark
colorscheme hybrid_material

let g:airline_theme = 'hybrid'

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--no-ignore'
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" editor config plugin settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn|optimized|compiled|node_modules|bower_components)$'
"let g:ctrlp_max_depth = 40
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" | grep -v "`cat ~/.ctrlpignore`"'
endif

set timeoutlen=1000 ttimeoutlen=0

" TODO: Pick a leader key
let mapleader = ","
nnoremap ,, ,

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

set cursorline
set foldenable
nmap <silent> <BS> :nohlsearch<CR>

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set nobackup
set noswapfile

" autosave files when vim loses focus
au FocusLost,WinLeave * :wa
"au FocusGained,

" Disable backup and swap files
set nobackup
set noswapfile

" Automatically load changed files
set autoread

" Use the OS clipboard
"set clipboard=unnamed

" Show matching brackets/parenthesis
set showmatch
" Don't blink when matching
set matchtime=0

" Case insensitive search
set ignorecase
" Case sensitive if we type an uppercase
set smartcase

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Make macros render faster (lazy draw)
set lazyredraw


" autoindent
set autoindent

"map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

syntax enable

