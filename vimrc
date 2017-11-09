set number
syntax on
filetype plugin indent on

let mapleader = " "

set hidden " Prevent the need to save before changing buffers
set nowrap        " don't wrap lines
set smartcase     " ignore case if search pattern is all lowercase
set smarttab      " insert tabs on the start of a line according to
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set backspace=indent,eol,start
set tabstop=2
"set expandtab

" Remove pesky python pep8
let g:python_recommended_style=0

" PLUGINS
call plug#begin()

"language syntax plugins
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'tpope/vim-haml'
Plug 'othree/html5.vim'
Plug 'tbastos/vim-lua'
Plug 'hdima/python-syntax'
Plug 'keith/tmux.vim'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mitsuhiko/vim-jinja'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'chrisbra/csv.vim'
Plug 'cespare/vim-toml'
Plug 'kshenoy/vim-signature'
Plug 'vim-perl/vim-perl'
Plug 'beyondmarc/opengl.vim'
Plug 'beyondmarc/glsl.vim'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jiangmiao/auto-pairs'

Plug 'qpkorr/vim-bufkill'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

call plug#end()

" Change color scheme
colorscheme busybee

" jinja highlighting
au BufNewFile,BufRead *.jinja2 set ft=jinja

" jsx highlighting for .js files
let g:jsx_ext_required = 0

"airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"persistent undo for when vim is closed
set undofile

"the amount of : commands saved and undo levels saved
set history=10000
set undolevels=10000
set lazyredraw

"MAPPINGS
map <Leader>. @:

" FZF
map <C-p> :Files <CR>
map <leader>fa :Ag <CR>
map <leader>fg :GFiles <CR>
map <leader>fb :Buffers <CR>
map <leader>fl :Lines <CR>
map <leader>fs :Snippets <CR>
map <leader>fc :Commits <CR>
map <leader>ff :BCommits <CR>
map <leader>fm :MRUFilesCWD <CR>

"NERDTree
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let g:NERDTreeMapHelp = '<F1>'
map <C-\> :NERDTreeToggle <CR>
map <Leader>2 :NERDTreeFind

" WINDOW SPLITTING
noremap <Leader>h :split <cr>
noremap <Leader>v :vsplit <cr>
map <Leader>p :set paste! <CR>

" emacs style beginning and end of line
inoremap <C-e> <End>
inoremap <C-a> <Home>

"change where vim stores backup and swap files
""set backupdir=~/.vim/backup//
set nobackup
set noswapfile
set undodir=~/.vim/undo//

"let g:gitgutter_realtime = 1
"let g:gitgutter_eager = 1
set updatetime=250

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Change the way tabs look
set list
set listchars=tab:--,nbsp:.

nnoremap ; :
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Map q to close to prevent accidentally quitting
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Set the color of indented characters
let g:indentLine_color_term = 239

" Changing and closing buffers
noremap <leader>m :bn <CR>
noremap <leader>n :bp <CR>
noremap <C-d> :BD! <CR>

" Disable dumb folding
set nofoldenable

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Set terminal colors
hi Normal ctermbg=234
hi SpecialKey ctermbg=234 ctermfg=238

" Ale
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'python': ['flake8'],
\ 'ruby': ['brakeman']
\}

" shortcut to edit vimrc
:command Vimrc e ~/.vimrc
map <C-e> :Vimrc <CR>
