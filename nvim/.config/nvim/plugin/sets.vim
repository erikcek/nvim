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
set mouse=a


"----------------------------------------------------------------------------------------
" Gruwbox
"----------------------------------------------------------------------------------------

" Color config
colorscheme gruvbox

let g:gruvbox_invert_selection=0
let g:gruvbox_sign_column='dark1'
let g:gruvbox_invert_signs=0


"----------------------------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------------------------

set completeopt=menuone,noselect            " Popup menu for insert mode completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

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
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true


nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

