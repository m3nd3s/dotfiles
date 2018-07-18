" Vim plugins
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'rstacruz/sparkup'
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'tomtom/tlib_vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'yaymukund/vim-rabl'
Plug 'tpope/vim-rails'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'Shutnik/jshint2.vim'
Plug 'rorymckinley/vim-rubyhash'
Plug 'kana/vim-textobj-user'
Plug 'terryma/vim-multiple-cursors'
Plug 'danchoi/ruby_bashrockets.vim'
Plug 'ngmy/vim-rubocop'
Plug 'jgdavey/tslime.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'Chun-Yang/vim-action-ag'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'leafgarland/typescript-vim'
Plug 'jgdavey/vim-blockle'
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'
Plug 'jayflo/vim-skip'

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
"set relativenumber" enable relative numbers
set numberwidth=5
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set nohlsearch    " highlight search terms
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

au FileType *_spec.rb set filetype=ruby.ruby-rspec
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

  " }}}
else
  " CTRLP
  set runtimepath^=~/.vim/bundle/ctrlp.vim
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
  let g:ctrlp_working_path_mode = 'ra'

  if executable('ag')
    " Use Ag over Grep
    let g:ag_prg="ag -i --vimgrep"

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g'

    " use cache
    let g:ctrlp_use_caching = 1
  endif
  map <leader>F :CtrlPClearCache<cr>:CtrlP<cr>
end

if executable('ag')
  " Use Ag over Grep
  let g:ag_prg="ag -i --vimgrep"
end

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Some maps for MacOS and Tabs
nmap <D-1> 1gt<cr>
nmap <D-2> 2gt<cr>
nmap <D-3> 3gt<cr>
nmap <D-4> 4gt<cr>
nmap <D-5> 5gt<cr>
nmap <D-6> 6gt<cr>
nmap <D-7> 7gt<cr>
nmap <D-8> 8gt<cr>
nmap <D-9> 9gt<cr>

nmap <C-l> :NERDTreeToggle<cr>
let g:NERDTreeWinSize = 40

" Tagbar
nmap <F8> :TagbarToggle<CR>

" No toolbars
set go-=T
set ttimeoutlen=50

" Airline
"let g:airline_theme='solarized'
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

" Remove trailing whitespace
au BufWritePre * :%s/\s\+$//e

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Format inline XML using gg=G
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au FileType json setlocal equalprg=python\ -m\ json.tool

" Mapping
"
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set pastetoggle=<F2>
set showmode

nmap <Leader>cs :let @*=expand("%")<CR>
nmap <Leader>cl :let @*=expand("%:p")<CR>

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
