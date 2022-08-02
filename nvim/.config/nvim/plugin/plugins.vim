
"----------------------------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------------------------

" Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

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
local actions = require "telescope.actions"
require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        theme = "ivy",
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '-uu' -- **This is the added flag**
        }
    },
    extensions = {
        file_browser = {
          theme = "ivy",
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["<leader-e"] = actions.close,
              ["o"] = actions.select_default
            },
          },
        },
      },
}
require("telescope").load_extension "file_browser"
EOF


"----------------------------------------------------------------------------------------
" Neoterm
"----------------------------------------------------------------------------------------

" Added help for all neoterm commands
silent! helptags ALL

let g:vimspector_base_dir='/Users/erikcek/.vim/plugged/vimspector'

