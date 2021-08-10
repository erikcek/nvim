
"----------------------------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------------------------

let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$', '.DS_Store', ".git$"] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline

" Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree Syntax Highlight
" Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 

" Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 

" This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


"----------------------------------------------------------------------------------------
" Telescope
"----------------------------------------------------------------------------------------

lua << EOF
require('telescope').setup{
    defaults = {
        prompt_prefix = "🔍 ", 
        file_ignore_patterns = { "node_modules", ".git" }    
    }
}
EOF
