set nocompatible

set ignorecase
set hlsearch
set incsearch

set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,default
set expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

nnoremap [m] <Nop>
map      <Space> [m]
nnoremap <silent> [m]f :<C-u>Unite -start-insert buffer file_mru bookmark file<CR>
nnoremap <silent> [m]n :<C-u>Unite -start-insert file<CR>
nnoremap <silent> [m]b :<C-u>Unite -start-insert neobundle/search<CR>
nnoremap <silent> [m]x :<C-u>Unite -start-insert command mapping<CR>
nnoremap <silent> [m]o :VimFiler -split -simple -winwidth=20 -no-quit<CR>
nnoremap <silent> [m]O :VimFiler -simple -no-quit<CR>
nnoremap <silent> [m]. :b #<CR>
nnoremap <silent> [m]u :GundoToggle<CR>
nnoremap <silent> [m]r :QuickRun<CR>

nnoremap <ESC><ESC> :nohlsearch<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set wildmode=longest,list

hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

set hidden
set number
set nobackup


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell.vim' " Powerful shell implemented by vim.

NeoBundle 'vimtaku/hl_matchit.vim.git'
NeoBundle 'scrooloose/syntastic' " Syntax checking hacks for vim
NeoBundle 'vim-scripts/vim-auto-save' " Automatically save changes to disk
NeoBundle 'bufexplorer.zip' " 6.0.2 Buffer Explorer / Browser
NeoBundle 'shinzui/gundo.vim'
NeoBundle 'vimgrep.vim' " 1.0   Editing utilities using grep/find without external grep/find programs
NeoBundle 'visualstar.vim' " 0.2.0 star(*) for Visual-mode.
NeoBundle 'vimez/vim-showmarks' " Show bookmarks beside number column.
NeoBundle 'rails.vim' " 18    Ruby on Rails: easy file navigation, enhanced syntax highlighting, and more
NeoBundle 'neocomplcache' " 2.36  Ultimate auto completion system for Vim
NeoBundle 'vim-ruby/vim-ruby' " Vim/Ruby Configuration Files
NeoBundle 'thinca/vim-quickrun' " Run commands quickly.
NeoBundle 'surround.vim' " 1.6   Delete/change/add parentheses/quotes/XML-tags/much more with ease
NeoBundle 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter (sign column).
NeoBundle 'Align' " 27/31 Help folks to align text, eqns, declarations, tables, etc

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck

source ~/.vim/color/molokai.vim

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'javascript'],
      \ 'passive_filetypes': []
      \ }

let g:auto_save = 1  " enable AutoSave on Vim startup

set list listchars=tab:>-,trail:_

let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1

set modifiable
set write

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

let g:showmarks_include='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

let g:neocomplcache_enable_at_startup = 1

let g:quickrun_config = {}
let g:quickrun_config['ruby'] = {'command': 'rspec'}

"let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
"augroup MyRSpec
"        autocmd!
"        autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
"augroup END
