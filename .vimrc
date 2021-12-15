" Vim plugins
call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'tomtom/tlib_vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'keith/rspec.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'adelarsq/vim-matchit'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'wookayin/fzf-ripgrep.vim'
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
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'erietz/vim-terminator'
call plug#end()

colorscheme dracula
let g:dracula_colorterm=0
set background=dark
set termguicolors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set nocompatible

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
set clipboard=unnamedplus
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

"Markdown syntax
au BufRead,BufNewFile *.mkd setfiletype mkd
au BufRead,BufNewFile *.markdown setfiletype mkd

" Auto lang and spell
au BufRead,BufNewFile *.mkd,*.md,*.markdown,*.txt setlocal spell

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

autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

"=================================
"FZF Configiration
"================================
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }

" Search for files
nnoremap <silent> <leader>f :GFiles<cr>
nnoremap <silent> <leader>F :Files<cr>

" search for buffer and history
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

"Search for lines (current and loaded buffers)
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>

"Ag
if executable('ag')
  " Use Ag over Grep
  let g:ag_prg="ag --vimgrep --path-to-ignore ~/.ignore"
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
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0
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

" vim-rspec mappings
let g:rspec_command = 'call Send_to_Tmux("./docker/rspec -fd {spec}\n")'
map <Leader>tt :call RunCurrentSpecFile()<CR>
map <Leader>ts :call RunNearestSpec()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>ta :call RunAllSpecs()<CR>

nmap <Leader>cs :let @+=expand("%")<CR>
nmap <Leader>cl :let @+=expand("%:p")<CR>
nmap <Leader>cr :let @+=('./docker/rspec -fd ' . expand("%") . ':' . line("."))<CR>
nmap <Leader>ct :let @+=('./docker/rspec -fd ' . expand("%"))<CR>

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

  let @+=(result . commit . '/' . expand("%") . lines)
endfunction

nmap <Leader>cg :call RepositoryCopyLineUrl()<CR>
vnoremap <Leader>cg :call RepositoryCopyLineUrl()<CR>

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

nnoremap <silent> <Leader>n :!open %<CR><CR>

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️ '
let g:ale_ruby_rubocop_executable = 'bundle'
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
