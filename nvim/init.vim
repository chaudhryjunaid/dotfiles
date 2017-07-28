" Don't try to be vi compatible
set nocompatible

" Baseline
set encoding=utf-8
scriptencoding utf-8

"set term=xterm-256color


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
function! InstallTypings(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g typings
  endif
endfunction
function! InstallTypescript(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g typescript
  endif
endfunction



call plug#begin('~/.vim/plugged')

"Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-git'
"Plug 'scrooloose/syntastic', { 'do': function('InstallLinters') }
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': function('BuildTern')  }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'easymotion/vim-easymotion'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim', { 'do': function('InstallSilverSearcher') }
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'shougo/vimproc.vim', { 'do': function('MakeVimProc') }
Plug 'jelera/vim-javascript-syntax' " Additional JS syntax highlighting
Plug 'burnettk/vim-angular' " Angular functionality
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair

"For JavaScript development
Plug 'moll/vim-node' " Node js
Plug 'groenewege/vim-less' " Less syntax
Plug 'othree/javascript-libraries-syntax.vim' " Javascript syntax library highlighting
Plug 'othree/jspc.vim' " Javascript parameter completion
Plug '1995eaton/vim-better-javascript-completion' " Expansion of vim's javascript

Plug 'bronson/vim-trailing-whitespace'
Plug 'gorodinskiy/vim-coloresque'
Plug 'wavded/vim-stylus'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim', { 'do': function('InstallEditorConfig') }
Plug 'chiel92/vim-autoformat', { 'do': function('InstallJSBeautify') }
"Plug 'mhartington/oceanic-next'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', { 'do': function('InstallTypescript') }
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-js-pretty-template'
Plug 'mhartington/vim-typings', { 'do': function('InstallTypings') }
Plug 'Shougo/unite.vim'

call plug#end()

" Turn on syntax highlighting
filetype plugin indent on
syntax on

set t_Co=256   " This is may or may not needed.

set background=dark

colorscheme PaperColor
"colorscheme lucius
"let g:airline_theme='lucius'
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'
"let g:enable_bold_font = 1
"colorscheme hybrid_material
"let g:airline_theme = 'hybrid'

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

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

"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
"
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_args = '--no-ignore'
"let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
"
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

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
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn|optimized|compiled|node_modules|bower_components)$'
let g:ctrlp_max_depth = 40
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" | grep -v "`cat ~/.ctrlpignore`"'
endif

set timeoutlen=1000 ttimeoutlen=0

" TODO: Pick a leader key
let mapleader = ","
nnoremap ,, ,

" map jk and kj to escape
imap jk <esc>
imap kj <esc>

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

set cpoptions+=$

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
"set foldenable
"set foldmethod=syntax
nmap <silent> <BS> :nohlsearch<CR>

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase

" autosave files when vim loses focus
au FocusLost,WinLeave * :wa
au FocusGained,BufEnter * :silent! !

" Disable backup and swap files
set nobackup
set noswapfile

"set autoread
"au FocusGained,CursorHold,CursorHoldI * checktime

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
"set foldmethod=syntax
"set foldnestmax=10
"set nofoldenable
"set foldlevel=1

" Make macros render faster (lazy draw)
set lazyredraw


" autoindent
set autoindent

set shortmess+=I

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
set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

syntax enable

