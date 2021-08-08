" Auto formatting 
augroup neoformat
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * undojoin | Neoformat
augroup end
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

