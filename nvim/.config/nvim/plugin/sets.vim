"----------------------------------------------------------------------------------------
" General settings           
"----------------------------------------------------------------------------------------

set undodir=~/.vim/undodir                  " set undotree file directory
set undofile                                " set undotree to save to file
set relativenumber                          " Relative numbers
set number                                  " Current line number
set nowrap                                  " set no soft wrap
set noerrorbells                            " Do not ring bell for error messages 
set tabstop=4                               " Tabs
set signcolumn=yes                          " Extra gutter for stuff
"set termguicolors                           " Use terminal colors
set wildmenu                                " Command line completion shows a list of matches
set softtabstop=4                           
set shiftwidth=4   
set expandtab          
set nowritebackup                                            
set noswapfile
set nobackup
set breakindent                                      
set smartindent
set smartcase
set incsearch
set hidden
set updatetime=250
set shortmess+=c
set noshowmode
set scrolloff=10

" Search stuff
set hlsearch                                " Highlight searches
set ignorecase                              " Ignore case of searches
set smartcase
set incsearch

" Splits
set splitbelow
set splitright


"----------------------------------------------------------------------------------------
" Gruwbox
"----------------------------------------------------------------------------------------

" Color config
colorscheme gruvbox

let g:gruvbox_invert_selection=0
let g:gruvbox_sign_column='dark1'
let g:gruvbox_invert_signs=0

" Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
