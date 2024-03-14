# Dependencies
First you need to install some dependencies

```bash
> sudo dnf copr enable atim/lazygit -y
> sudo dnf install lazygit git-delta -y
> sudo dnf install -y python3-pip ripgrep
> sudo dnf install -y rust cargo
> cargo install stylua
> ln -s ~/.cargo/bin/stylua ~/.local/bin/stylua
```

for better experience with lazygit you need to setup the git config, to use delta as pager, include the following lines on ~/.gitconfig
```bash
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only --side-by-side --line-numbers --paging
[conflict]
    style = diff3
```                 

also you need to install this python3 package for python autocompletion
```bash
> pip3 install --upgrade pynvim jedi pyperclip debugpy
```

to work with go you will also need to install golang
```bash
> sudo dnf install -y golang delve
```

and install libs to help
```bash
> go install golang.org/x/tools/gopls@latest
> go install golang.org/x/tools/cmd/goimports@latest
```

after that its necessary to install neovim on fedora is just run the following command
you can also download the appimage from the official site
```bash
> sudo dnf install -y neovim
```

after install neovim you need to install vim-plug to install the plugins automagically
```bash
> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

after install the vim-plug replace the current init.vim on ~/.config/nvim/init.vim
```bash
> git clone https://github.com/marinellirubens/nvim-config.git ~/.config/nvim
```

Nerd fonts to correct the icons on the dap
```bach
https://www.nerdfonts.com/font-downloads
```
