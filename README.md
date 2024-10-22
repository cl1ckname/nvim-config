# My NeoVim configuration to develop with Golang
This is my daily Lua based config to write code. Kinda a little IDE. I was collected it step by step including only required required for me minimum. The idea of this build is to create a pretty fast toolkit to use it as main code editor via TMux and other TUI tools. Feel free to fork it or write any suggestions and advices.
<br>
When designing this repository, I was guided by [magidc/nvim-config](https://github.com/magidc/nvim-config). Check it out too!


# Installation
## Manual Setup
0. Clone this repository into `~/.config/nvim`:
    ```
    git clone https://github.com/cl1ckname/nvim-config.git ~/.config/nvim --depth=1
    ```
1. Install latest [NeoVIM version](https://github.com/neovim/neovim/wiki/Installing-Neovim). The configuration also includes an script to install automatically Neovim in APT based Linux distributions (Debian, Ubuntu, PopOs...). See [install_nvim.sh](https://github.com/cl1ckname/nvim-config/blob/master/install_nvim.sh)
2. Install [ripgrep](https://github.com/BurntSushi/ripgrep) into your OS. It is required by some [Telescope](https://github.com/nvim-telescope/telescope.nvim) plugin searching modes.

3. This environment is preconfigured with Language Server Providers (LSP) for Golang and Lua. These components provide IDE features like autocompletions, error highlight or debugging. As it is required to have installed these components in your system, this Neovim setup relies on [mason.nvim](https://github.com/williamboman/mason.nvim#installation) plugin to install them automatically if they are missing.
<br>
