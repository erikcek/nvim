set exrc
set relativenumber
set number
set hidden 
set noerrorbells
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

set updatetime=50

set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

colorscheme gruvbox

nnoremap <SPACE> <Nop>
let mapleader = " "  

" Custom Mappings ------ {{{
" Quick ESC
inoremap jj <ESC>
" Write
nnoremap <leader>w :write<cr>
" Save
nnoremap <leader>s :update<cr>
" Quit
nnoremap <leader>q :quit<cr>
" }}}


" Windows And Splits ------ {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
" }}}


" Search ------ {{{
nnoremap / /\v
vnoremap / /\v
" set gdefault                          " Adds g at the end of substitutions by default
set hlsearch                          " Highlight searches
set ignorecase                        " Ignore case of searches
set smartcase
" }}}


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" rainbow
let g:rainbow_active = 1

" undo tree
nnoremap <F5> :UndotreeToggle<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

