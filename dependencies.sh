# install pyenv dependencies
sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libzstd-dev

# install pyenv
curl -fsSL https://pyenv.run | bash

# cargo and treesitter
sudo apt install isort
sudo apt install -y clang libclang-dev llvm-dev build-essential pkg-config
sudo apt install cargo

cargo install tree-sitter-cli
sudo apt install luarocks
