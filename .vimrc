set encoding=utf-8
set fenc=utf-8
set nowritebackup
set nobackup
set noswapfile
set virtualedit=onemore
set backspace=indent,eol,start
set ambiwidth=double
set wildmenu
set cursorline
set cursorcolumn
set belloff=all
colorscheme monokai

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set shellslash
set showmatch matchtime=1
set cinoptions+=:0
set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set history=10000
hi Comment ctermfg=3

set ts=4
set sw=4
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set showmatch
set smartindent
set nofoldenable
set title
set number
set clipboard=unnamed,autoselect
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
syntax enable
set nrformats=
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a

" 行末の空白除去
autocmd BufWritePre * :%s/\s\+$//ge

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif


call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tyru/caw.vim'
Plug 'Shougo/unite.vim'
call plug#end()

" airline
let g:airline_theme = 'papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" ale
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
  \ 'ruby': ['rubocop'],
  \}

" caw.vim
nmap <C-K> <Plug>(caw:zeropos:toggle)
vmap <C-K> <Plug>(caw:zeropos:toggle)

