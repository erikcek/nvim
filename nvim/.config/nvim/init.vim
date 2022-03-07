"----------------------------------------------------------------------------------------
" Plugins loading
"----------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

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

    " Easymotion
    Plug 'easymotion/vim-easymotion'

    " Gitgutter
    Plug 'airblade/vim-gitgutter'

    " Illuminate
    Plug 'RRethy/vim-illuminate'

    Plug 'tpope/vim-surround'

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

    " Targets on steroids
    Plug 'wellle/targets.vim'

    " Snippets godies
    " Plug 'honza/vim-snippets'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

    " Autocompletion
    Plug 'hrsh7th/nvim-compe'

    " LSP
    Plug 'neovim/nvim-lspconfig'

    " Formatting
    Plug 'sbdchd/neoformat'

    Plug 'itchyny/lightline.vim'
    Plug 'mhinz/vim-startify'
    Plug 'szw/vim-maximizer'
    Plug 'kassio/neoterm'

call plug#end()


