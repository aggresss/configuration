" Vim config file composed by aggresss

set nocompatible    " required
filetype off        " required
let mapleader="\\"

" check if use bundle
if filereadable(expand("~/.vimrc.bundles"))
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' " required
  Plugin 'taglist.vim'    " require install exuberant-ctags
  Plugin 'cscope.vim'     " require install cscope
  Plugin 'scrooloose/nerdtree'
  Plugin 'Valloric/YouCompleteMe'     " require compile

  call vundle#end()
  source ~/.vimrc.bundles    " source the plugin config
endif

filetype plugin indent on   " required

" editor style list
colorscheme desert
highlight Pmenu ctermfg=black ctermbg=darkcyan
highlight PmenuSel ctermfg=black ctermbg=gray
syntax on
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set noswapfile
set number
set nowrap
set cursorline
set ts=4 sts=4 sw=4 et
set list
set listchars=tab:>-,trail:-
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" keyboard shortcut list
:map <F1>  :TlistToggle<cr>
:map <F2>  :NERDTreeToggle<cr>
:map <F3>  :Vexplore<cr>
:map <F4>  :Sexplore<cr>
:map <F5>  :Texplore<cr>
:map <F6>  :tabclose<cr>
:map <F7>  :bdelete<cr>
:map <F8>  :qall!<cr>
:map <F9>  :tabprevious<cr>
:map <F10> :tabfirst<cr>
:map <F11> :tablast<cr>
:map <F12> :tabnext<cr>
:map <C-l> :vertical res +4<cr>
:map <C-h> :vertical res -4<cr>
:map <C-j> :res +2<cr>
:map <C-k> :res -2<cr>

"
" Custom command
"
" Trim CRLF to LF
command TrimCRLF %s/\r\(\n\)/\r/g
" Trim redundancy sapce at the end of line
command TrimEOL %s/\s\+$//g
" Trim number at the head of line
command TrimHnumber %s/^[0-9]\{1,}//g
" Trim one space at the head of line
command TrimOnespace %s/^\s//g
" Trim spaces at the head of line
command Trimspaces %s/^\s*//g
" Trim html Trimspaces->TrimHnumber->TrimOnespace->TrimEOL
command Trimhtml %s/^\s*//g | %s/^[0-9]\{1,}//g | %s/^\s//g | %s/\s\+$//g

" EOF