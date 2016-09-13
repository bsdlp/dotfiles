" All system-wide defaults are set in $VIMRUNTIME/freebsd.vim (usually just
" /usr/share/vim/vimfiles/freebsd.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since freebsd.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing freebsd.vim since it alters the value of the
" 'compatible' option.
"

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" no vi compatibility
set nocompatible

set modelines=0

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
execute pathogen#infect()

" directory
set directory=$HOME/.vim
"
" disable backups (and swap)
set nobackup
set nowritebackup
set noswapfile

" wrap searches
set wrapscan

" tab and indentation
set tabstop=4
set softtabstop=4
set smarttab
set shiftwidth=4
set backspace=indent,eol,start
set autoindent
set smartindent
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set nocursorline
set synmaxcol=128
set laststatus=2
set nopaste

" show commands
set showcmd

" show line and column position of cursor
set ruler

" status bar
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %c,%l/%L]\
set laststatus=2
set cmdheight=1

" formatting options
set formatoptions=c,q,r,t

" line numbers
set number

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" syntax highlighting
filetype off
syntax on

" set colorscheme
colorscheme solarized
set background=dark

"allows sudo with :w!!
cmap w!! %!sudo tee > /dev/null %

" auto indent
filetype plugin indent on

" leader key to ,
let mapleader=","

" maintain more context around cursor
set scrolloff=3

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" VERY useful remap
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Fix keycodes
map ^[[1~ <Home>
map ^[[4~ <End>
imap ^[[1~ <Home>
imap ^[[4~ <End>

" clear highlights with ,<space>
nnoremap <leader><space> :noh<cr>

" map tab to %
nnoremap <tab> %

" hides buffers instead of closing them
set hidden

set history=1000   " remember more commands and search history
set undolevels=1000 " use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

set pastetoggle=<F2>

" Help key annoyance
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" auto-save on leaving focus
au FocusLost * :wa

" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" reselect things just pasted
nnoremap <leader>v V`]

" quick exit from insert
inoremap jj <ESC>

" open a new split and go to it ,w
nnoremap <leader>w <C-w>v<c-w>l

" remap for C-moving windowsing
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remap for tabsies
nnoremap <leader>[ gT
nnoremap <leader>] gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>
cnoreabbrev t tabedit
nnoremap <leader>t :tabedit ./<CR>

set grepprg=grep\ -nH\ $*

" fix mixed indents
map <F7> mzgg=G`z

" Python stuff
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

" indent-guides config
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=grey

"fuzzyfinder config
nnoremap <leader>f :FufFile<CR>
nnoremap <leader>b :FufBuffer<CR>
"
"fix the bad search color with solarized
hi Search ctermbg=7

" airline
let g:airline_powerline_fonts = 1
set ttimeoutlen=50
set t_Co=256

" puppet
let g:puppet_align_hashes = 1

" go stuff
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"" golint
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

source ~/.vim/plugin/comments.vim
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
