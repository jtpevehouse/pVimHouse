set nocompatible              " be iMproved, required
"filetype off                  " required
set number
set shell=sh
syntax on
set encoding=UTF-8

"""""""""""""""""""""""""
"        VUNDLE         "
"""""""""""""""""""""""""
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'preservim/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
"Plugin 'itchyny/lightline.vim'
"Plugin 'morhetz/gruvbox'
"Plugin 'shinchu/lightline-gruvbox.vim'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plugin 'dense-analysis/ale'
"Plugin 'ekalinin/Dockerfile.vim'
"call vundle#end()            " required
"filetype plugin indent on    " required

"""""""""""""""""""""""""
"       VIM-PLUG        "
"""""""""""""""""""""""""
call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'dense-analysis/ale'
Plug 'ekalinin/Dockerfile.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
call plug#end()

"""""""""""""""""""""""""
"       NERDTREE        "
"""""""""""""""""""""""""
augroup NERD
    au!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * wincmd p
    autocmd VimEnter * call lightline#update()
augroup END

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"""""""""""""""""""""""""
"      LIGHTLINE        "
"""""""""""""""""""""""""
set laststatus=2

let g:lightline = { 'colorscheme': 'gruvbox'}

if !has('gui_running')
  set t_Co=256
endif

"""""""""""""""""""""""""
"        SEARCH         "
"""""""""""""""""""""""""
let g:ackprg = 'ag --vimgrep'

"""""""""""""""""""""""""
"      TREE STATUS      "
"""""""""""""""""""""""""
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"""""""""""""""""""""""""
"     COLOR SCHEME      "
"""""""""""""""""""""""""
if has('termguicolors')
  set termguicolors
endif

set background=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_transparent_bg=1

colorscheme gruvbox 

"""""""""""""""""""""""""
"       PRETTIER        "
"""""""""""""""""""""""""
let g:prettier#config#print_width = 'auto'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'auto'
let g:prettier#config#parser = ''
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#config#require_pragma = 'false'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"""""""""""""""""""""""""
"       REMAPPING       "
"""""""""""""""""""""""""
command! Difft NERDTreeClose | windo diffthis
command! Diffts diffoff! | NERDTree
:noremap <F5> :NERDTreeToggle<CR>
:noremap <F2> :Difft<CR>
:noremap <F3> :Diffts<CR>
:noremap <F8> :vertical resize +10<CR>
:noremap <F7> :vertical resize -10<CR>
:noremap <C-p> :GFiles<CR>
:noremap <C-g> :Ag<CR>
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set expandtab
