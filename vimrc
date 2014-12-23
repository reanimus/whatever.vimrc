" >>> BEGIN CORE INIT (VUNDLE) (REQUIRED)
set nocompatible
filetype off
" <<< END CORE INIT  (VUNDLE) (REQUIRED)

" >>> BEGIN VUNDLE INIT
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" <<< END VUNDLE INIT

" >>> BEGIN VUNDLE PLUGIN LIST
Plugin 'gmarik/Vundle.vim' "<<REQUIRED>>
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wikimatze/hammer.vim'
" <<< END VUNDLE PLUGIN LIST

" >>> BEGIN VUNDLE CLEANUP
call vundle#end()            " required
filetype plugin indent on    " required
" <<< END VUNDLE CLEANUP

" >>> BEGIN USER CONFIG
" PLUGIN: vim-colors-solarized
""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized

" PLUGIN: hammer.vim
""""""""""""""""""""
let g:HAMMER_BROWSER="open"


" <<< END USER CONFIG
