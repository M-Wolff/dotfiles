# dotfiles
## How to clone
1. Define alias from .bash_aliases for `dotfiles`
2. Clone Repository: `git clone --bare <Link-to-Repository> $HOME/.dotfiles`

## Requirements
- tmux
- NodeJS (npm, ...) for Markdown Preview
- Install [vim-plug](https://github.com/junegunn/vim-plug) following their github's instructions

## Install plugins
- VIM: `:PlugInstall`
- CoC (inside VIM): 
    - `:CocInstall coc-clangd`
    - `:CocInstall coc-pyright`
    - `:CocInstall coc-tsserver`
    - `:CocInstall coc-vimtex`
    - `:CocInstall coc-python`
    - `:CocInstall coc-vimlsp`
    - `:CocInstall coc-snippets`
    - `:CocInstall coc-java`
