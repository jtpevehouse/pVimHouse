set nocompatible              " be iMproved, required
"filetype off                  " required
set number
set shell=sh
set syntax=on
set encoding=UTF-8

"""""""""""""""""""""""""
"        VUNDLE         "
"""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'prettier/vim-prettier', {'do': 'npm install'}
Plugin 'itchyny/lightline.vim'
Plugin 'sainnhe/sonokai'
Plugin 'airblade/vim-gitgutter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
call vundle#end()            " required
filetype plugin indent on    " required

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

"""""""""""""""""""""""""
"      LIGHTLINE        "
"""""""""""""""""""""""""
set laststatus=2

let g:lightline = {'colorscheme': 'apprentice',}

if !has('gui_running')
  set t_Co=256
endif

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
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

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
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

"""""""""""""""""""""""""
"      REMAPPINGS       "
"""""""""""""""""""""""""
command! Difft NERDTreeClose | windo diffthis
command! Diffts diffoff! | NERDTree 
:noremap <F5> :NERDTree<CR> 
:noremap <F2> :Difft<CR>
:noremap <F3> :Diffts<CR> 
