call plug#begin('~/.vim/plugged')

if !has('nvim')
    Plug 'tpope/vim-sensible'
endif

" Remove all custom auto commands
augroup vimrc
    autocmd!
augroup END


" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


" undo tree
Plug 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<CR>


" rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Formatting 
Plug 'sbdchd/neoformat'
autocmd vimrc BufWritePre * undojoin | Neoformat


" One to rule them all, one to find them, one to bring them all and in the darkness bind them.
" Plug 'sheerun/vim-polyglot'


Plug 'AndrewRadev/splitjoin.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sickill/vim-pasta'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'zivyangll/git-blame.vim'
Plug 'jiangmiao/auto-pairs'


" Themes
" Plug 'altercation/vim-colors-solarized'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'

call plug#end()

" Colorscheme
colorscheme onedark

" Vim settings
set exrc                                    " Use local .vimrc if exists
set relativenumber                          " Relative numbers
set number                                  " Current line number
set hidden                                  " Dont unload buffer  
set noerrorbells                            " Do not ring bell for error messages 
set tabstop=4                               " Tabs
set softtabstop=4                           
set shiftwidth=4                                
set expandtab
set smartindent
set nowrap                                  " Dont wrap lines
set noswapfile                              " Dont use .swap files
set nobackup                                " Dont keep backup after owerwritin file
set undofile                                " Use undo files for undo history
set undodir=~/.vim/undodir                  " Undo file directory
set termguicolors                           " Use terminal colors
set scrolloff=8                             " Number of lines to show around the cursor
set completeopt=menuone,noinsert,noselect   " Popup menu for insert mode compeltion
set signcolumn=yes                          " Extra gutter for stuff
set cursorline                              " Highlight current cursor line
set wildmenu                                " Command line completion shows a list of matches


" Leader mapping ------ {{{
nnoremap <SPACE> <Nop>
let mapleader = " "
" }}}


"Custom Mappings ------ {{{
inoremap jj <ESC>
nnoremap <leader>w :write<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>q :quit<cr>
nnoremap <C-n> :nohl<cr>
" }}}


" Windows And Splits ------ {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
" }}}


" Resize splits when the window is resized
autocmd vimrc VimResized * :wincmd =


" Autosave buffers before leaving them
autocmd vimrc BufLeave * silent! :wa"


" Search ------ {{{
nnoremap / /\v
vnoremap / /\v
" set gdefault                          " Adds g at the end of substitutions by default
set hlsearch                          " Highlight searches
set ignorecase                        " Ignore case of searches
set smartcase
" }}}


" LanguageClient
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rust-analyzer'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ 'go': ['gopls'],
      \ }
function SetLSPShortcuts()
    nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
    nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
    nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
    nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
    nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
    nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
    nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
    nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
    autocmd!
    autocmd FileType rust,ruby,go call SetLSPShortcuts()
augroup END

