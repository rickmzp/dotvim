" Section: vundle setup

  set nocompatible
  filetype off
  scriptencoding utf-8

  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()

  Bundle "gmarik/vundle"
  Bundle "Valloric/YouCompleteMe"
  Bundle "benmills/vimux"
  Bundle "jgdavey/vim-turbux"
  Bundle "godlygeek/tabular"
  Bundle "tpope/vim-endwise"
  Bundle "tpope/vim-cucumber"
  Bundle "tpope/vim-haml"
  Bundle "tpope/vim-rails"
  Bundle "vim-ruby/vim-ruby"
  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  Bundle "honza/vim-snippets"
  Bundle "SirVer/ultisnips"
  Bundle "kchmck/vim-coffee-script"
  Bundle "ecomba/vim-ruby-refactoring"
  Bundle "sjl/gundo.vim"
  Bundle "danchoi/ri.vim"
  Bundle "tpope/vim-ragtag"
  Bundle "scrooloose/syntastic"
  Bundle "scrooloose/nerdtree"
  Bundle "junegunn/seoul256.vim"
  Bundle "wincent/Command-T"
  Bundle "jnwhiteh/vim-golang"
  Bundle "terryma/vim-multiple-cursors"
  Bundle "juvenn/mustache.vim"
  Bundle "mattn/emmet-vim"
  Bundle "othree/html5.vim"
  Bundle "wikitopian/hardmode"
  Bundle "rking/ag.vim"
  Bundle "tpope/vim-surround"
  Bundle "tpope/vim-fugitive"
  filetype plugin indent on

" Section: configuration

  " I like pretty colors
  syntax on
  set t_Co=256
  let g:seoul256_background = 233
  colorscheme seoul256

  " Enable filetype-specific indenting and plugins
  filetype plugin indent on

  set hlsearch
  set ignorecase
  set smartcase
  set incsearch
  nmap \q :nohlsearch<CR>


  " flashes matching brackets or parentheses
  set showmatch

  " helps with backspacing because of expandtab
  set smarttab

  " Change <Leader>
  let mapleader = ","

  " Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " When scrolling off-screen do so 3 lines at a time, not 1
  set scrolloff=5

  " enable line numbers 
  set number
  setlocal numberwidth=5

  " Enable tab complete for commands.
  " first tab shows all matches. next tab starts cycling through the matches
  set wildmenu
  set wildmode=list:longest,full

  " Display extra whitespace
  set list listchars=tab:»·,trail:·

  " don't make it look like there are line breaks where there aren't:
  "set nowrap

  " assume the /g flag on :s substitutions to replace all matches in a line:
  "set gdefault

  " Load matchit (% to bounce from do to end, etc.)
  runtime! macros/matchit.vim

  " Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " enable setting title
  set title
  " configure title to look like: Vim /path/to/file
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " can has foldin plz?
  set foldenable
  set foldlevel=999 " make it really high, so they're not displayed by default
  set foldmethod=indent
  set foldnestmax=10

  " disable escape delay
  set noesckeys
  

  " Turn off rails bits of statusbar
  let g:rails_statusline=0

  " ignore github-markup gem missing
  let g:HammerQuiet=1

  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen=1
  " colored NERD Tree
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowHidden = 1
  " map enter to activating a node
  let NERDTreeMapActivateNode='<CR>'
  let NERDTreeIgnore=['\.git','\.DS_Store']

  let g:browser = 'open '

  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType javascript set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx 
    " treat rackup files like ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    autocmd BufEnter *.haml setlocal cursorcolumn
    au BufRead,BufNewFile Gemfile set ft=ruby                                   
    au BufRead,BufNewFile Capfile set ft=ruby                                   
    au BufRead,BufNewFile Thorfile set ft=ruby                                   
    au BufRead,BufNewFile *.god set ft=ruby  
  augroup END

  " my favorite identation [RM]
  set autoindent
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endi

  " Turn on language specific omnifuncs
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete


  " have some fun with bufexplorer
  let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

" IRB {{{
  autocmd FileType irb inoremap <buffer> <silent> <CR> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, eval(v[v.line_number]).inspect)<CR>

" Section: functions

  function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
  endfunction

  " Open the Rails ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRailsDoc(keyword)
    let url = 'http://apidock.com/rails/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

  " Open the Ruby ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRubyDoc(keyword)
    let url = 'http://apidock.com/ruby/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

" Section: commands

  " Shell
  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

  " Ruby code metrics
  command! -complete=file -nargs=+ Reek :Shell reek <q-args>
  command! -complete=file -nargs=+ Roodi :Shell roodi <q-args>
  command! -complete=file -nargs=+ Flog :Shell flog -m -I lib <q-args> 2>/dev/null

" Section: mappings

  ",v brings up my .vimrc
  map <leader>v :sp ~/.vimrc<CR><C-W>_

  ",V reloads it -- making all changes active (have to save first)
  map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

  " Tab navigation
  nmap <D-t> :tabnew<CR>
  nmap <D-w> :tabclose<CR>
  nmap <D-]> :tabnext<CR>
  nmap <D-[> :tabprevious<CR>
  nmap <leader>te :tabedit 

  " Remap F1 from Help to ESC.  No more accidents.
  nmap <F1> <Esc>
  map! <F1> <Esc>

  " Toggle NERDTree with <leader>D
  " map <silent> <leader>D :execute 'NERDTreeToggle ' . getcwd()<CR>

  " FuzzyFinder tags with <leader>T
  nnoremap <silent> <leader>T :FuzzyFinderTag!<CR>

  " <leader>F to begin searching with ack
  map <leader>F :Ack<space>

  " search next/previous -- center in page
  nmap n nzz
  nmap N Nzz
  nmap * *Nzz
  nmap # #nzz

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Hide search highlighting
  map <silent> <leader>nh :nohls <CR>

  " toggle Quickfix window with <leader>q
  map <silent> <leader>q :QFix<CR>

  nnoremap <leader>irb :<C-u>below new<CR>:setfiletype irb<CR>:set syntax=ruby<CR>:set buftype=nofile<CR>:set bufhidden=delete<CR>i

  " paste toggle
  set pastetoggle=<leader>p

  " Easily lookup documentation on apidock
  noremap <leader>rb :call OpenRubyDoc(expand('<cword>'))<CR>
  noremap <leader>rr :call OpenRailsDoc(expand('<cword>'))<CR>

  map <C-c>n :cnext<CR>
  map <C-c>p :cprevious<CR>

  function! RspecToMocha()
    silent! %s/\.stub!\?(/.stubs(/
    silent! %s/and_return/returns/
    silent! %s/should_receive/expects/
    silent! %s/should_not_receive\((.*)\)/expects\1.never
    silent! %s/and_raise/raises/
    :w
  endfunction
  command! RspecToMocha call RspecToMocha()
  
  " enable per-directory .vimrc files
  set exrc
  set secure  " disable unsafe commands in local .vimrc files

  " limit autocomplete to current file and ctags
  set complete=.,t,b


  " show long lines as errors
  " match ErrorMsg '\%>80v.\+'

  " unwanted whitespace removal for ruby
  autocmd BufWritePre *.rb :%s/\s\+$//e
  autocmd BufWritePre *.py :%s/\s\+$//e
  autocmd BufWritePre *.php :%s/\s\+$//e
  autocmd BufWritePre *.haml :%s/\s\+$//e
  autocmd BufWritePre *.js :%s/\s\+$//e
  autocmd BufWritePre *.coffee :%s/\s\+$//e
  autocmd BufWritePre *.feature :%s/\s\+$//e

  " NeoComplCache
  let g:neocomplcache_enable_at_startup = 1

  " use tjump instead of tag
  noremap <C-]> g<C-]>

  " gist options
  let g:gist_open_browser_after_post = 1
  let g:gist_show_privates = 1
  let g:gist_private = 1

  " notes options
  let g:notes_directory = '~/Documents/Notes'
  let g:notes_tagsindex = '~/Documents/Notes/.tags'
  let g:notes_suffix    = '.mkdn'

  " ctrlp
  set wildignore+=*.gif,*.jpg,*.png,*/coverage/*,*/doc/*,*/.git/*,*/db/backups/*,*/tmp/*,*/vendor/bundle/*
  nmap <Leader>f :CommandT<CR>
  nmap <Leader>k :CommandTBuffer<CR>
  nmap <leader>j :CommandTJump<CR>

  " map <leader>t :e ~/Dropbox/todo/todo.txt<CR>
  map <leader>z :Tabularize /\|<CR>
  
  inoremap jj <Esc>

  " matchit
  runtime macros/matchit.vim

  " vimux
  let VimuxUseNearestPane = 1

  " turbux
  " let g:turbux_command_rspec  = 'smart_rspec'
  " let g:turbux_command_test_unit = 'zeus test'
  " let g:turbux_command_cucumber = 'cucumber --drb'
  let g:turbux_command_rspec  = 'time spring rspec'
  let g:turbux_command_test_unit  = 'time spring test'
  let g:turbux_command_cucumber = 'time spring cucumber'

  let g:turbux_command_turnip = 'rspec'
  map <C-T> <Plug>SendTestToTmux
  map <C-F> <Plug>SendFocusedTestToTmux
  map <C-E> :VimuxRunLastCommand<CR>
  map <C-P> :VimuxPromptCommand<CR>

  " paste toggle
  nnoremap <leader>p :set invpaste paste?<CR>
  set pastetoggle=<leader>p
  set showmode

  " nmap <C-t>e  :call RunVimTmuxCommand("smart_rspec spec/models/event_spec.rb spec/models/events/*")<CR>

  nnoremap  <leader>ri :call ri#OpenSearchPrompt(0)<cr> " horizontal split
  nnoremap  <leader>RI :call ri#OpenSearchPrompt(1)<cr> " vertical split
  nnoremap  <leader>RK :call ri#LookupNameUnderCursor()<cr> " keyword lookup 
  
  set winwidth=80
  set winheight=5
  set winminheight=5
  
  nnoremap <silent> + :exe "resize " . (winwidth(0) * 3/2)<CR>
  nnoremap <silent> - :exe "resize " . (winwidth(0) * 2/3)<CR>

  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  set cursorline cursorcolumn
  nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

  let g:syntastic_mode_map = { "mode": "active",
                             \ "active_filetypes": ["ruby"],
                             \ "passive_filetypes": [] }
  let g:rails_projects = {
                       \   "api/": {
                       \     "test": [ "spec/api/%s_spec.rb" ]
                       \   }
                       \ }

  " autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

  function! MapCR()
      nnoremap <cr> :nohlsearch<cr>
  endfunction
  call MapCR()

  augroup vimrcEx
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()
  augroup END

  if &term =~ '^screen'
      " tmux will send xterm-style keys when its xterm-keys option is on
      execute "set <xUp>=\e[1;*A"
      execute "set <xDown>=\e[1;*B"
      execute "set <xRight>=\e[1;*C"
      execute "set <xLeft>=\e[1;*D"
  endif
