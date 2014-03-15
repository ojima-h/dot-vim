if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/syntastic' " Syntax checking hacks for vim
NeoBundle 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter (sign column).
NeoBundle 'neocomplcache' " 2.36  Ultimate auto completion system for Vim

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
