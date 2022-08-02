"----------------------------------------------------------------------------------------
" Plugins loading
"----------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

    " LSP
    Plug 'neovim/nvim-lspconfig'
    " Language server installer
    Plug 'williamboman/nvim-lsp-installer'

    " " Autocompletion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    " Other completion sources
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-cmdline'

    " Snippets
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    " Schemastore support for json lsp
    Plug 'b0o/schemastore.nvim'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'

    " Gruwbox
    Plug 'morhetz/gruvbox'

    " CSS colors
    Plug 'ap/vim-css-color'

    " Lightspeed
    Plug 'ggandor/lightspeed.nvim'

    " Gitgutter
    Plug 'airblade/vim-gitgutter'

    " Illuminate
    Plug 'RRethy/vim-illuminate'

    " Status line
    Plug 'vim-airline/vim-airline'

    " tpope goodies
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'


    " Undotree
    Plug 'mbbill/undotree'

    " NERDTree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " Icons
    Plug 'ryanoasis/vim-devicons'

    Plug 'rafamadriz/friendly-snippets'

    " Formatting
    Plug 'sbdchd/neoformat'

    Plug 'itchyny/lightline.vim'
    Plug 'mhinz/vim-startify'
    Plug 'szw/vim-maximizer'
    Plug 'kassio/neoterm'

    " debugger
    Plug 'puremourning/vimspector'

call plug#end()


