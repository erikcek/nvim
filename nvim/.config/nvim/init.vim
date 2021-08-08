" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Leader
nnoremap <SPACE> <Nop>
let mapleader=" "

call plug#begin('~/.vim/plugged')
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" NERDTree
Plug 'preservim/nerdtree'
" undotree
Plug 'mbbill/undotree'
" Formatting 
Plug 'sbdchd/neoformat'
" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" tpope goodies
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" Easymotion
Plug 'easymotion/vim-easymotion'
" Gitgutter
Plug 'airblade/vim-gitgutter'
" Illuminate
Plug 'RRethy/vim-illuminate'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'sickill/vim-pasta'
Plug 'zivyangll/git-blame.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/quickfonts.vim'
Plug 'AndrewRadev/splitjoin.vim'
" Themes
Plug 'joshdick/onedark.vim'
" LSP
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-compe'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()

" General mappings 
nnoremap <silent> Q <nop>
inoremap jj <ESC>
nnoremap <leader>w :write<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>q :quit<cr>
" Black hole
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" Yank should behave like the rest of the children... 
nnoremap Y y$
" Keep cursor centered while searching
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Best remaps ever
vnoremap J :m '>+1'<cr>gv=gv
vnoremap K :m '<-2'<cr>gv=gv
inoremap <C-j> <esc>:m .+1<cr>==i
inoremap <C-k> <esc>:m .-2<cr>==i
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==
" Add blank lines
nnoremap <leader>o mzo<esc>`z
nnoremap <leader>O mzO<esc>`z
" Remove highlights 
nnoremap <C-n> :nohl<cr>
" Vertical split resizing
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" Navigate between splits and tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader><Tab> gt 
nnoremap <leader><S-Tab> gT

