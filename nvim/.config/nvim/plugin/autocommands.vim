" Auto formatting
" augroup neoformat
"     autocmd!
"     autocmd BufWritePre * %s/\s\+$//e
"     autocmd BufWritePre *.js Neoformat prettier
"     autocmd BufWritePre *.ts Neoformat prettier
"     autocmd BufWritePre *.jsx Neoformat prettier
"     autocmd BufWritePre *.tsx Neoformat prettier
"     autocmd BufWritePre *.py Neoformat autopep8
"     " autocmd BufWritePre * undojoin | Neoformat
" augroup end

" autocmd BufWritePre * lua vim.lsp.buf.formatting()

" Resize splits when the window is resized
augroup splits
    autocmd!
    autocmd VimResized * :wincmd =
augroup end

" Autosave buffers before leaving them
augroup autosave
    autocmd!
    autocmd BufLeave * silent! :wa"
augroup end

