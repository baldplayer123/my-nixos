filetype plugin indent on
syntax on
colorscheme retrobox

set number
set relativenumber

set hlsearch
set expandtab
set tabstop=4
set autoindent

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

inoremap <expr> ) getline('.')[col('.')-1] == ')' ? '<Right>' : ')'
