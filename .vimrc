set nocompatible
set number
set relativenumber
set tabstop=4
set shiftwidth=5
set expandtab

set autoindent
set backspace=indent,eol,start
set scrolloff=7
set list
set listchars=tab:›\ ,extends:›,precedes:‹,nbsp:·,trail:·
filetype plugin on

set path+=**
set wildmenu

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
