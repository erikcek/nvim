REPO="https://github.com/erikcek/nvim.git"

echo "Installing neovim..."


if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        echo "Installing brew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Updating brew..."
        brew update
    fi

    which -s npm
    if [[ $? != 0 ]] ; then
        # Install Npm
        echo "Installing npm..."
        sudo brew install node
    else
        echo "Npm exists. Skiping..."
    fi

    which -s nvim
    if [[ $? != 0 ]] ; then
        echo "Installing neovim"
        sudo brew install neovim
    else
        echo "Neovim exists. Skiping..."
    fi

    DIR='${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'
    if [ -d "$DIR" ]; then
        # Take action if $DIR exists. #
        echo "Vim-plug exists. Skiping..."
    else
        echo "Installing Vim-plug"
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

else
    # Expecting Ubuntu.
    which -s npm
    if [[ $? != 0 ]] ; then
        # Install Npm
        echo "Installing node and npm..."
         apt install nodejs
         apt install npm
    else
        echo "Npm exists. Skiping..."
    fi

    which -s nvim
    if [[ $? != 0 ]] ; then
        echo "Installing neovim"
         apt install neovim
    else
        echo "Neovim exists. Skiping..."
    fi

    DIR='${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'
    if [ -d "$DIR" ]; then
        # Take action if $DIR exists. #
        echo "Vim-plug exists. Skiping..."
    else
        echo "Installing Vim-plug"
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

fi

DIR='~/nvim'
if [ -d "$DIR" ]; then
    # Take action if $DIR exists. #
    echo "Direstory nvim already exists in HOME. Unable setup neovim from git. Exiting..."
    exit 1
else
    echo "${Green}Cloning nvim repository..."
    git clone $REPO ~/nvim
    sh ~/nvim/install
    sh ~/nvim/install_lsp_servers.sh
    nvim --headless +PlugInstall +qall
fi

