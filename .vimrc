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
" Ctrl-l toggles line numbers
nnoremap <C-l> :call ToggleLineNumbers()<CR>
" <leader>ih toggles InlayHints (i.e. datatype hints, argument names, ... in
" code; default=OFF)
nnoremap <silent> <leader>ih :CocCommand document.toggleInlayHint<CR>
" rename command (first one does NOT work in Vim, only NeoVim)
"nmap <leader>r <Plug>(coc-rename)
" Workaround for broken rename command (mainly the GUI popup is broken, bypass
" it by giving the rename-to parameter using normal VIM input)
" expand('<cword>') will set the word under cursor (i.e. the variable to
" be renamed) as the default pre-typed entry for the input(...) function, so
" one can just make small changes to the variable name without having to type
" it out again from scratch
nnoremap <leader>r :call CocAction('rename', input('Rename to: ', expand('<cword>')))<CR>
nnoremap <S-r> :call CocAction('rename', input('Rename to: ', expand('<cword>')))<CR>
nnoremap <leader>d :call CocAction('doHover')<CR>
nnoremap <leader>f :call CocAction('format')<CR>
" Ctrl-s saves currently opened file without quitting
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>
" jump to definition with gd (cursor on method name -> jump to definition of
" this method; even in different file)
nmap <silent> gd <Plug>(coc-definition)

nnoremap <C-m> <Plug>MarkdownPreviewToggle
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
" Markdown Preview 
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && npx --yes yarn install'}
" UltiSnips (because coc-snippets isn't great)
Plug 'SirVer/ultisnips'
call plug#end()
" Set CtrlP root dir to r=nearest ancestor containing .git folder or
" a=directory of current file (if not subdir of cwd)
let g:ctrlp_working_path_mode = 'ra'
" Ignore LaTeX-specific files that will never be edited anyways
let g:ctrlp_custom_ignore = {
      \ 'file': '\v\.(aux|log|bbl|blg|out|toc|lof|lot|fls|fdb_latexmk|gz|pdf|nav|snm|bcf)$'
      \ }
colorscheme catppuccin_mocha " Select mocha theme from catppuccin (after Plugin is loaded)
" Buffer Type 'Quick Fix' set LineNr to a more readable color (not the same as
" background...)
autocmd FileType qf highlight LineNr ctermfg=yellow guifg=#fab387
" ##############################################################################
" Tab Autocomplete Key for CoC
function! CheckBackspace() abort
	return 1
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger = "<nop>"
let g:UltiSnipsJumpBackwardTrigger = "<nop>"
" Tab for Snippet execution & normal Tab elsewhere
inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#confirm() :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
" Shift-Tab for Jumping
inoremap <silent><expr> <S-Tab>
  \ coc#jumpable() ?
  \ "\<C-r>=coc#rpc#request('snippetNext', [])\<CR>" :
  \ "\<S-Tab>"



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

" ############################### Seperator Block ##############################
" this method generates a Seperator Block like the one directly above
" i.e. line filled with '#' with text centered in the middle
function! SeperatorText()
  " Input Text
  let input = input("Geben Sie den Text ein: ")
  let line = getline(".")
  let len = strlen(line)
  " if input empty, just create a line full of '#'
  if empty(input)
    let padding = repeat("#", 40) " 40 because padding is added two times (total 80)
    let new_line = padding. padding
  else " otherwise: pad input with one space left and right and fill rest of the line with '#' symmetrically
    let padding = repeat("#", (80 - strlen(input) - 2) / 2)
    let new_line = padding. " ". input. " ". padding
  endif
  if strlen(new_line) < 80 " for odd numbers of input characters add one extra '#'
    let new_line.= "#"
  endif
  " set current line (overwrite) to seperator block generated
  call setline(".", new_line)
endfunction
" ############################ Toggle Line Numbers #############################
"
function! ToggleLineNumbers()
  if &number && &relativenumber
      set nonumber norelativenumber
  elseif &number
     set relativenumber
  else
     set number
  endif
 endfunction

" make seperator block
nnoremap <silent> <Leader>l :call SeperatorText()<CR>
" ############################ VimTeX autoindent fix #############################
autocmd FileType tex setlocal indentexpr=
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
