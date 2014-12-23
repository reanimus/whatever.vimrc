" >>> BEGIN VUNDLE-AUTO-MAGIC-INIT
let wow_vundle_new=0
let wow_no_vundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "wow no vundle, such install"
    echo ""
    if system( 'git --version' ) !~ '^git'
      echohl WarningMsg | echomsg 'such sad. please more git.' | echohl None
    else
      silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
      let wow_vundle_new=1
      let wow_no_vundle=0
    endif
else
    let wow_no_vundle=0
endif
" <<< END VUNDLE-AUTO-MAGIC-INIT

" >>> BEGIN CORE INIT (VUNDLE) (REQUIRED)
if wow_no_vundle == 0
    set nocompatible
    filetype off
endif
" <<< END CORE INIT  (VUNDLE) (REQUIRED)

" >>> BEGIN VUNDLE INIT
" set the runtime path to include Vundle and initialize
if wow_no_vundle == 0
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
" <<< END VUNDLE INIT

" >>> BEGIN VUNDLE PLUGIN LIST
if wow_no_vundle == 0
    Plugin 'gmarik/Vundle.vim' "<<REQUIRED>>
    Plugin 'tpope/vim-fugitive'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'wikimatze/hammer.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-eunuch.git'
endif
" <<< END VUNDLE PLUGIN LIST

" >>> BEGIN VUNDLE-AUTO-MAGIC-BUNDLE-INIT
if wow_vundle_new == 1
    echo "wow no plugins, ignore such errors"
    echo ""
    :BundleInstall
    :bdelete
endif
" <<< END VUNDLE-AUTO-MAGIC-BUNDLE-INIT

" >>> BEGIN VUNDLE CLEANUP
if wow_no_vundle == 0
    call vundle#end()            " required
    filetype plugin indent on    " required
endif
" <<< END VUNDLE CLEANUP

" >>> BEGIN USER CONFIG
if wow_no_vundle == 0
    " PLUGIN: vim-colors-solarized
    """"""""""""""""""""""""""""""
    syntax enable
    set background=dark
    colorscheme solarized

    " PLUGIN: hammer.vim
    """"""""""""""""""""
    let g:HAMMER_BROWSER="open"

    " PLUGIN: nerdtree
    """"""""""""""""""
    " open automatically when no files are specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " hack to workaround a bug when deleting buffers
    function! g:WorkaroundNERDTreeToggle()
        try | :NERDTreeToggle | catch | :NERDTree | endtry
    endfunction

    " map to ctrl-o
    map <C-o> :call g:WorkaroundNERDTreeToggle()<CR>

    " close the tree when opening a file
    let g:NERDTreeQuitOnOpen = 1

    " Check if NERDTree is open or active
    function! rc:isNERDTreeOpen()        
      return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    endfunction
     
    " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
    " file, and we're not in vimdiff
    function! rc:syncTree()
      if &modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        try | :NERDTreeFind | catch | :NERDTree | :NERDTreeFind | endtry
        wincmd p
      endif
    endfunction
     
    " close vim if nerdtree is the only remaining buffer
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif | call rc:syncTree()
endif
" CORE:
"""""""
set nu

" bad netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" tabs are the DEVIL
set expandtab
set tabstop=4
set shiftwidth=4

" <<< END USER CONFIG
