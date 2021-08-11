
# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
NC='\033[0m'

REPO="https://gitlab.com/erikcek/nvim.git"

echo "${Green}Installing neovim...${NC}"


if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        echo "${Green}Installing brew...${NC}"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "${Green}Updating brew...${NC}"
        brew update
    fi

    which -s npm
    if [[ $? != 0 ]] ; then
        # Install Npm
        echo "${Green}Installing npm...${NC}"
        brew install node
    else
        echo "${Green}Npm exists. Skiping...${NC}"
    fi

    which -s nvim
    if [[ $? != 0 ]] ; then
        echo "${Green}Installing neovim${NC}"
        brew install neovim
    else
        echo "${Green}Neovim exists. Skiping...${NC}"
    fi

    DIR='${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'
    if [ -d "$DIR" ]; then
        # Take action if $DIR exists. #
        echo "${Green}Vim-plug exists. Skiping...${NC}"
    else
        echo "${Green}Installing Vim-plug${NC}"
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

else
    # Expecting Ubuntu.
    which -s npm
    if [[ $? != 0 ]] ; then
        # Install Npm
        echo "${Green}Installing node and npm...${NC}"
        sudo apt install nodejs
        sudo apt install npm
    else
        echo "${Green}Npm exists. Skiping...${NC}"
    fi

    which -s nvim
    if [[ $? != 0 ]] ; then
        echo "${Green}Installing neovim${NC}"
        sudo apt install neovim
    else
        echo "${Green}Neovim exists. Skiping...${NC}"
    fi

    DIR='${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'
    if [ -d "$DIR" ]; then
        # Take action if $DIR exists. #
        echo "${Green}Vim-plug exists. Skiping...${NC}"
    else
        echo "${Green}Installing Vim-plug${NC}"
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

fi

DIR='~/nvim'
if [ -d "$DIR" ]; then
    # Take action if $DIR exists. #
    echo "${RED}Direstory nvim already exists in HOME. Unable setup neovim from git. Exiting...${NC}"
    exit 1
else
    echo "${Green}${Green}Cloning nvim repository...${NC}"
    git clone $REPO ~/nvim
    sh ~/nvim/install
    sh ~/nvim/install_lsp_servers.sh
    nvim --headless +PlugInstall +qall
fi

