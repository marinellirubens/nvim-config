# Dependencies
First you need to install some dependencies

Note: nodejs and yarn will be used on coc
```bash
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
sudo dnf install -y nodejs python3-pip ripgrep
sudo npm install -g yarn
```
also you need to install this python3 package for python autocompletion

```bash
pip3 install --upgrade pynvim jedi
```

to work with go you will also need to install golang
```bash
sudo dnf install -y golang
```

and install libs to help
```bash
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
```

after that its necessary to install neovim on fedora is just run the following command
```bash
sudo dnf install -y neovim
```

after install neovim you need to install vim-plug to install the plugins automagically
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

after install the vim-plug replace the current init.vim on ~/.config/nvim/init.vim
```bash
git clone https://github.com/marinellirubens/nvim-config.git
mkdir -p ~/.config/nvim
cp ./nvim-config/init.vim ~/.config/nvim/init.vim
```

after that you can install all the plugins using the following command
```bash
nvim +PlugInstall +qall
nvim +'CocInstall coc-python coc-go' +qall
nvim +'CocInstall coc-python coc-go' +qall
nvim +'VimspectorInstall debugpy'
nvim +'VimspectorInstall vscode-go'
```


