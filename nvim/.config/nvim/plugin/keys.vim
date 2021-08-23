
"----------------------------------------------------------------------------------------
" General
"----------------------------------------------------------------------------------------

" map leader
let mapleader=","

" exit remap
inoremap jj <ESC>

" Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Map clipboard to paste
vnoremap <leader>c "*y
" Map clipboard to paste
vnoremap <leader>v "*p

" Map show undo tree
nnoremap <leader>u :UndotreeShow<CR>

" Line moving
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Map escape for terminal emulator
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" Map to replace text under cursor
nnoremap <leader>sr :%s/\<<C-r><C-w>\>/

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>e :q<CR>
nnoremap <leader>q :q!<CR>

" Panel switching
nnoremap <S-h> :wincmd h<CR>
nnoremap <S-j> :wincmd j<CR>
nnoremap <S-k> :wincmd k<CR>
nnoremap <S-l> :wincmd l<CR>

" Maximizer
nnoremap <leader>m :MaximizerToggle<cr>

"----------------------------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------------------------

noremap <silent> <C-b> :NERDTreeToggle<CR>
noremap <Leader>pp :NERDTreeToggle<CR>
" Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>


"----------------------------------------------------------------------------------------
" Easy motion
"----------------------------------------------------------------------------------------

map <Leader><Leader> <Plug>(easymotion-prefix)


"----------------------------------------------------------------------------------------
" Terminal
"----------------------------------------------------------------------------------------

nnoremap <Leader>tt :tabnew \| term<CR>

nnoremap <C-n> :noh<CR>


"----------------------------------------------------------------------------------------
"Telescope
"----------------------------------------------------------------------------------------

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope file_browser<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>


"----------------------------------------------------------------------------------------
" Lsp
"----------------------------------------------------------------------------------------

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <CR> pumvisible() ? compe#confirm('<CR>') : "<CR>"
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>

