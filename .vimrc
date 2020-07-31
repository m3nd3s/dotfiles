" Vim plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'tomtom/tlib_vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'keith/rspec.vim'
Plug 'adelarsq/vim-matchit'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'css',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

call plug#end()

set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype on
filetype plugin on
filetype indent on

syntax on

" Leader key
let mapleader=","

set shell=/bin/bash
set hidden
set nowrap        " don't wrap lines
set tabstop=2
set shiftwidth=2
set softtabstop=2
set tabpagemax=20
set showtabline=2
set smarttab
set smartindent
set expandtab
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set numberwidth=5
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch    " highlight search terms
set incsearch     " show search matches as you type
set title
set visualbell           " don't beep
set noerrorbells         " don't beep
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set undofile  "Maintain undo history between sessions
set undodir=~/.vim/undodir
set nobackup
set noswapfile
set nowritebackup
set autoread "Teoricamente deve recarregar o arquivo quando alterado
set guioptions-=r " Removes right hand scroll bar
set clipboard+=unnamed
set mouse=a
set ttymouse=xterm2
set wildmenu "Better popup menu
set confirm "Dialog to ask when closing unsave changes

"Disable sounds and screen flashing
set visualbell
set t_vb=

"May be improve the speed
set lazyredraw
set ttyfast

au User Rails let b:surround_{char2nr('-')} = "<% \r %>"

" Wildignore
set wildignore+=*.o,*.obj,system*,*.svg,*.ttf,*.eot,*.jpg,*.png,*.gif,*.log,tmp,yard_templates,coverage
set list listchars=tab:»·,trail:·

" Set statusline
set laststatus=2

" Set column limit
set colorcolumn=120

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set redrawtime=10000

" show tab number
au BufRead,BufNewFile * set guitablabel=%N.\ %t\ %M

"Nginx syntaxe
au BufRead,BufNewFile /usr/local/nginx/conf/* set ft=nginx

"Markdown syntax
au BufRead,BufNewFile *.mkd setfiletype mkd
au BufRead,BufNewFile *.markdown setfiletype mkd

" Auto lang and spell
" setlocal spell spelllang=pt
au BufRead,BufNewFile *.mkd,*.md,*.markdown,*.txt setlocal spell
"autocmd FileType ruby set nospell

au BufRead,BufNewFile .pryrc setfiletype ruby

" Gemfile syntax
au BufRead,BufNewFile Gemfile set filetype=ruby

" Javascript syntax
au BufRead,BufNewFile *.js.* set filetype=javascript
au BufRead,BufNewFile *.ts set filetype=javascript

" JSON syntax
au BufRead,BufNewFile *.json.* set filetype=javascript

" Tmux syntax
au BufRead,BufNewFile .tmux.conf set ft=tmux

" This is just a handy trick to automatically load the .vimrc file whenever
" you save it. I usually tweak something and I want it to take effect
" immediately, that’s why I have this setting.
" au BufWritePost .vimrc so $MYVIMRC

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" FZF
set rtp+=/usr/local/opt/fzf

map <Leader>f :FZF<CR>
let g:fzf_buffers_jump = 1
if executable('fzf')
  " FZF {{{
  " <C-p> or <C-t> to search files
  nnoremap <silent> <C-t> :FZF -m<cr>
  nnoremap <silent> <C-p> :FZF -m<cr>

  " <M-p> for open buffers
  nnoremap <silent> <M-p> :Buffers<cr>

  " <M-S-p> for MRU
  nnoremap <silent> <M-S-p> :History<cr>

  " Use fuzzy completion relative filepaths across directory
  imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

  command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
end

if executable('ag')
  " Use Ag over Grep
  let g:ag_prg="ag -i --vimgrep --path-to-ignore ~/.ignore"
end

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

nmap <C-l> :NERDTreeToggle<cr>
nmap <C-k> :NERDTreeFind<cr>
let g:NERDTreeWinSize = 40
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" No toolbars
set go-=T
set ttimeoutlen=50

" Airline
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0

" Remove trailing whitespace
au BufWritePre * :%s/\s\+$//e

" Format inline XML using gg=G
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au FileType json setlocal equalprg=python\ -m\ json.tool

set pastetoggle=<F2>
set showmode

nmap <Leader>cs :let @*=expand("%")<CR>
nmap <Leader>cl :let @*=expand("%:p")<CR>
nmap <Leader>cr :let @*=('rspec -f documentation ' . expand("%") . ':' . line("."))<CR>
nmap <Leader>ct :let @*=('rspec -f documentation ' . expand("%"))<CR>

" Vim miltiple cursors remap
let g:multi_cursor_next_key  = '<C-n>'
let g:multi_cursor_prev_key  = '<C-p>'
let g:multi_cursor_skip_key  = '<C-x>'
let g:multi_cursor_quit_key  = '<Esc>'
let g:multi_cursor_start_key = '<F6>'

" RubyNewHashNotation
command! -range=% RubyNewHashNotation silent execute <line1>.','.<line2>.'s/:\(\w\+\)\s*=>\s*/\1: /g'

" Configure snipMate
let g:description_in_completion = 1

" Map nohlsearch
nmap <silent> ./ :nohlsearch <CR>

function! RepositoryCopyLineUrl()
  let line1 = a:firstline
  let line2 = a:lastline
  let commit = substitute(system('git rev-parse HEAD'), '[\]\|[[:cntrl:]]', '', 'g')
  let cmd = 'git ls-remote --get-url | sed "s/:/\//g" | sed "s/git@/https:\/\//g" | sed "s/\.git/\/blob\//g"'
  let result = substitute(system(cmd), '[\]\|[[:cntrl:]]', '', 'g')

  if line1 != line2
    let lines = '#L' . line1 . '-' . line2
  else
    let lines = '#L' . line1
  endif

  let @*=(result . commit . '/' . expand("%") . lines)
endfunction

nmap <Leader>cg :call RepositoryCopyLineUrl()<CR>
vnoremap <Leader>cg :call RepositoryCopyLineUrl()<CR>

" ALE
let g:ale_lint_delay = 2500

" Prettier
let g:prettier#autoformat = 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Edit vimr configuration file
nnoremap <Leader>ve :tabe $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
