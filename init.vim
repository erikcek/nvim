call plug#begin('~/.vim/plugged')

if !has('nvim')
    Plug 'tpope/vim-sensible'
endif

" Leader mapping ------ {{{
nnoremap <SPACE> <Nop>
let mapleader = " "
" }}}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NERDTree
Plug 'preservim/nerdtree'
nnoremap <C-p> :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" NERDTree related
Plug 'Xuyuanp/nerdtree-git-plugin'

" undo tree
Plug 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<CR>
set undofile                                " Use undo files for undo history
set undodir=~/.vim/undodir                  " Undo file directory


" Formatting 
Plug 'sbdchd/neoformat'
augroup neoformat
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup end

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'RRethy/vim-illuminate'
Plug 'vim-airline/vim-airline'
Plug 'sickill/vim-pasta'
Plug 'zivyangll/git-blame.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/quickfonts.vim'

" Themes
" Plug 'altercation/vim-colors-solarized'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'

" Language server
Plug 'neovim/nvim-lspconfig'
" Language server installer
Plug 'kabouzeid/nvim-lspinstall'
" Autocompletion
Plug 'hrsh7th/nvim-compe'
call plug#end()

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "tsserver", "dockerls", "graphql", "terraformls", "vimls", "yamlls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

lua << EOF
require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
EOF

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
EOF

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
set termguicolors                           " Use terminal colors
set scrolloff=8                             " Number of lines to show around the cursor
set completeopt=menuone,noinsert,noselect   " Popup menu for insert mode completion
set signcolumn=yes                          " Extra gutter for stuff
set cursorline                              " Highlight current cursor line
set wildmenu                                " Command line completion shows a list of matches


"Custom Mappings ------ {{{
inoremap jj <ESC>
nnoremap <leader>w :write<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>q :quit<cr>
nnoremap J +
nnoremap K -
" }}}


" Search ------ {{{
nnoremap <C-n> :nohl<cr>
" nnoremap / /\v
" vnoremap / /\v
" set gdefault                          " Adds g at the end of substitutions by default
set hlsearch                          " Highlight searches
set ignorecase                        " Ignore case of searches
set smartcase
set incsearch
" }}}


" Tabs ------ {{{
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" }}}


" Windows And Splits ------ {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
" }}}
augroup splits
    autocmd!
    " Resize splits when the window is resized
    autocmd VimResized * :wincmd =
augroup end

augroup autosave
    autocmd!
    " Autosave buffers before leaving them
    autocmd vimrc BufLeave * silent! :wa"
augroup end

