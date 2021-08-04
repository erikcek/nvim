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
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Mappings
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({})<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" NERDTree
Plug 'preservim/nerdtree'
nnoremap <leader><C-p> :NERDTreeToggle<cr>
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
" Autocompletion
Plug 'hrsh7th/nvim-compe'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()

" Telescope settings
lua << EOF
require('telescope').setup{
    defaults = {
        prompt_prefix = "🔍 ", 
        file_ignore_patterns = { "node_modules", ".git" }    
    }
}
EOF


" Language servers
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
    buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "bashls", "dockerls", "graphql", "html", "jsonls", "pyright", "terraformls", "tsserver", "vimls", "vuels", "yamlls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
            }
        }
end
EOF

" Compe
set completeopt=menuone,noselect            " Popup menu for insert mode completion

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <Tab> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

" Vimsnip
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']


" Colorscheme
colorscheme onedark

" Vim settings
set exrc                                    " Use local .vimrc if exists
set relativenumber                          " Relative numbers
set number                                  " Current line number
set hidden                                  " Dont unload buffer  
set noerrorbells                            " Do not ring bell for error messages 
set tabstop=4                               " Tabs
set formatoptions-=ro                       " Do not insert comment character after <cr>
set softtabstop=4                           
set shiftwidth=4                                
set expandtab
set smartindent
set nowrap                                  " Dont wrap lines
set noswapfile                              " Dont use .swap files
set nobackup                                " Dont keep backup after owerwritin file
set termguicolors                           " Use terminal colors
set scrolloff=10                            " Number of lines to show around the cursor
set signcolumn=yes                          " Extra gutter for stuff
set cursorline                              " Highlight current cursor line
set wildmenu                                " Command line completion shows a list of matches

"Custom Mappings ------ {{{
inoremap jj <ESC>
nnoremap <leader>w :write<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>q :quit<cr>
" }}}

" Behave vim
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Best remap ever
vnoremap J :m '>+1'<cr>gv=gv
vnoremap K :m '<-2'<cr>gv=gv
inoremap <C-j> <esc>:m .+1<cr>==i
inoremap <C-k> <esc>:m .-2<cr>==i
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

" Add blank lines
nnoremap <leader>o mzo<esc>`z
nnoremap <leader>O mzO<esc>`z

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
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
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
    autocmd BufLeave * silent! :wa"
augroup end

