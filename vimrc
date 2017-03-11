set number
"set relativenumber
syntax on
filetype plugin indent on

let mapleader = " "

" PLUGINS
call plug#begin()

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
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
Plug 'junegunn/fzf.vim'
" plug 'Valloric/YouCompleteMe'

call plug#end()

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

" Highlight the line you are on
set lazyredraw

"MAPPINGS
map <Leader>. @:

colorscheme busybee

"###################################
" FZF CONFIG
" #################################
map <C-p> :Files <CR>
map <leader>fa :Ag <CR>
map <leader>fg :GFiles <CR>
map <leader>fb :Buffers <CR>
map <leader>fl :Lines <CR>
map <leader>fs :Snippets <CR>
map <leader>fc :Commits <CR>
map <leader>ff :BCommits <CR>
map <leader>fm :MRUFilesCWD <CR>

"NERDTree stuff
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let g:NERDTreeMapHelp = '<F1>'

map <C-\> :NERDTreeToggle <CR>
map <Leader>2 :NERDTreeFind
map <C-]> :UndotreeToggle <CR>

" WINDOW SPLITTING
noremap <Leader>h :split <cr>
noremap <Leader>v :vsplit <cr>

noremap <C-g>  <cr>

map <C-m> :bn <CR>
map <C-n> :bp <CR>
map <C-d> :bd <CR>

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

set hidden " Prevent the need to save before changing buffers
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase
set smarttab      " insert tabs on the start of a line according to
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set backspace=indent,eol,start

" Redraw screen and remove search hightlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

set list
set listchars=tab:--,nbsp:.

nnoremap ; :
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
