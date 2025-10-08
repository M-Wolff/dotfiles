# dotfiles
## How to clone
1. Define alias from .bash_aliases for `dotfiles`
2. Clone Repository: `git clone --bare <Link-to-Repository> $HOME/.dotfiles`

## Requirements
- tmux
- NodeJS (npm, ...) for Markdown Preview
- npm install -g yarn
- Install [vim-plug](https://github.com/junegunn/vim-plug) following their github's instructions
## Add custom stuff to default `.bashrc`
- create file for individual additions to .bashrc in `~/.bashrcs_custom/<PCName>.bashrc`
- link to correct device-specific file: `ln ~/.bashrcs_custom/<PCName>.bashrc ~/.bashrc_custom`

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
