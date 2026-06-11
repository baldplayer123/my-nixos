filetype plugin indent on
syntax on

syntax on
colorscheme retrobox

autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
            \ | highlight NonText ctermbg=NONE guibg=NONE
            \ | highlight EndOfBuffer ctermbg=NONE guibg=NONE
            \ | highlight LineNr ctermbg=NONE guibg=NONE
            \ | highlight SignColumn ctermbg=NONE guibg=NONE

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

