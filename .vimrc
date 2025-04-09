filetype plugin indent on " Switch indentation and plugin support on for each filetype
syntax on " Enable Syntax-Highlighting
set number " line numbers
set relativenumber " every line number except current is relative to current
set termguicolors " select colorscheme
set hlsearch " highlight search results
set incsearch " make search incremental (i.e. highlight all matches while typing)
set autoindent " automatic indentation based on previous line
set smartindent " smart indentation for certain filetypes (i.e. loops in C)
set spelllang=en_us,de_de " Select available languages for spell-checking
"set spell " enable spell checker (not recommended for non-prose files)
set autochdir "NERDTree auto change dir (make current opened file's parent the root of NERDTree)
" Ctrl-n toggles NERDTree on/off 
nnoremap <C-n> :NERDTreeToggle<CR>
" Ctrl-h removes highlighting of last search
nnoremap <C-h> :noh<CR>
" <leader>ih toggles InlayHints (i.e. datatype hints, argument names, ... in
" code; default=OFF)
nnoremap <silent> <leader>ih :CocCommand document.toggleInlayHint<CR>
" rename command (first one does NOT work in Vim, only NeoVim)
"nmap <leader>r <Plug>(coc-rename)
" Workaround for broken rename command (mainly the GUI popup is broken, bypass
" it by giving the rename-to parameter using normal VIM input)
nnoremap <leader>r :call CocAction('rename', input('Rename to: '))<CR>
nnoremap <C-r> :call CocAction('rename', input('Rename to: '))<CR>
" Ctrl-s saves currently opened file without quitting
nnoremap <silent> <C-s> :w<CR>
" jump to definition with gd (cursor on method name -> jump to definition of
" this method; even in different file)
nmap <silent> gd <Plug>(coc-definition)
" make Shift-Tab do Tab to be able to do normal Tabs in insert mode again
" (because regular Tab == Autocomplete CoC suggestion)
inoremap <S-Tab> <Tab>
" Loading Plugins
call plug#begin()
" catppuccin color scheme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Conquer-of-Completion (CoC) for vim; fancy autocompletion with support for
" various filetypes (python, LaTeX, ...)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" LaTeX compiling and auto-update of rendered PDF when saving *.tex file
Plug 'lervag/vimtex'
" Fuzzy Search
Plug 'ctrlpvim/ctrlp.vim'
" Find & Replace Highlighting and Preview 
Plug 'markonm/traces.vim'
call plug#end()
" Set CtrlP root dir to r=nearest ancestor containing .git folder or
" a=directory of current file (if not subdir of cwd)
let g:ctrlp_working_path_mode = 'ra'
colorscheme catppuccin_mocha " Select mocha theme from catppuccin (after Plugin is loaded)

" ##############################################################################
" Tab Autocomplete Key for CoC
" CheckBackspace() checks if cursor is at line beginning or after space
 function! CheckBackspace() abort
   let col = col('.') - 1
     return !col || getline('.')[col - 1]  =~# '\s'
     endfunction
" use <Tab> to confirm currently selected autocompletion
" If CheckBackspace() is false, do regular tab instead
" if autocomplete suggestion menu was not visible AND CheckBackspace is False,
" then CoC will refresh autocompletion menu (i.e. open it)
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" ##############################################################################
" Set Virtual Environment for CoC accordingly to match current selected venv
" in shell that called Vim
function! SetPythonPath()
    let venv = $VIRTUAL_ENV
    if empty(venv)==0
        " Set CoC Path on <venv_root>/bin/python
        let g:coc_node_path = venv. '/bin/python'
    endif
endfunction

" Execute on VimEnter (when calling vim from shell)
autocmd VimEnter * call SetPythonPath()
