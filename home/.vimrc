set nocompatible
set number
set incsearch
set hlsearch

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" editing options
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start

let g:airline_powerline_fonts = 1

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'ntpeters/vim-better-whitespace'
Plug 'slim-template/vim-slim'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
" Plug 'scrooloose/syntastic'
Plug 'ddollar/nerdcommenter'
Plug 'vim-ruby/vim-ruby'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-rails'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'
Plug 'ngmy/vim-rubocop'
" Plug 'junegunn/fzf.vim'
call plug#end()

set t_Co=256
let g:seoul256_background = 233
colorscheme seoul256
set nocursorline
set nocursorcolumn

let mapleader = ","
nnoremap <SPACE> :nohlsearch<CR>
" nmap <LEADER>f :FZF<CR>

" Airline stuff
set laststatus=2
set noshowmode
set timeoutlen=1000 ttimeoutlen=0

" Vim trailing whitespace mappings
nnoremap <leader>r :StripWhitespace<CR>
vnoremap <leader>r :StripWhitespace<CR>

" NERDCommenter mappings
nnoremap <leader>c :call NERDComment(0, "toggle")<CR>
vnoremap <leader>c :call NERDComment(0, "toggle")<CR>

" Do not use swapfile
set noswapfile

" Settings for terminals only
if &term =~ '^xterm' || &term == 'screen-256color'
 " line in insert mode
 let &t_SI .= "\<Esc>[6 q"
 " solid block on normal mode
 let &t_EI .= "\<Esc>[2 q"
endif

" Utilisnips plugin settings
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vimux
let VimuxUseNearestPane = 1
let g:turbux_command_rspec  = 'time rspec'
let g:turbux_command_test_unit  = 'time test'
let g:turbux_command_cucumber = 'time cucumber'
map <C-T> <Plug>SendTestToTmux
map <C-F> <Plug>SendFocusedTestToTmux

",v brings up my .vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>_

",V reloads it -- making all changes active (have to save first)
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" enable per-directory .vimrc files
set exrc
set secure  " disable unsafe commands in local .vimrc files

autocmd BufNewFile,BufRead *.slim set ft=slim
