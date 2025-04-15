# dotfiles
## How to clone
1. Define alias from .bash_aliases for `dotfiles`
2. Clone Repository: `git clone --bare <Link-to-Repository> $HOME/.dotfiles`

## Install plugins
- VIM: `:PlugInstall`
- CoC (inside VIM): 
    - `:CocInstall coc-clangd`
    - `:CocInstall coc-pyright`
    - `:CocInstall coc-tsserver`
    - `:CocInstall coc-vimtex`
    - `:CocInstall coc-python`
    - `:CocInstall coc-vimlsp
