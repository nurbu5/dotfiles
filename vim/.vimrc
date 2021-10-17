" font: InputMono 14 pt.
"
" You'll need to have nodeJS installed to run coc.nvim
" you might get an error if your node version is not high enough
" DON'T Forget to run :PlugInstall in vim in order to install your plugins
"
" List of language servers:
" https://github.com/neoclide/coc.nvim/wiki/Language-servers
"
""""""""""vim-plug settings""""""""""
" vim-plug: https://github.com/junegunn/vim-plug
" This code downloads vimplug if you don't already have it
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
" Ruby
" Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
" Python
" Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""some coc settings""""""""""
" Tab completion https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <Tab> to move down autocomplete list
" By default we can use Ctrl-N to move down and Ctrl-P to move up
"inoremap <silent><expr> <Tab>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<Tab>" :
"    \ coc#refresh()

" Use <Tab> to confirm completion
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Use <cr> to confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" LANGUAGE SPECIFIC
""""""""""""""""""" Golang
" Add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" Run go formatter after saving a file
" This moves the cursor to the top of the buffer :(
" autocmd FileType go autocmd BufWritePost <buffer> :goimports -w %

" Use "gd" to goto definition
nmap <silent> gd <Plug>(coc-definition)

""""""""""""""""""" Markdown, Text, Vimrc, or no filetype
" Turn off autocomplete for markdown and text files
autocmd FileType markdown,text,vim let b:coc_suggest_disable = 1
" Turn off autocomplete for files without a filetype
autocmd BufNewFile,BufRead * if empty(&filetype) | execute 'let b:coc_suggest_disable = 1' | endif

"""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""fzf settings""""""""""

"Change the default mapping and the default command to invoke CtrlP
set rtp+=~/.fzf

map <c-p> :FZF<cr>

"When invoked, unless a starting directory is specified, CtrlP will set its
"local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""""""""""""""""""""""""

"Syntax highlighting, and indent
syntax on
filetype plugin indent on

" set the max number of lines (automatically line break at textwidth)
set textwidth=120

" dim console when line in areas where line is too long (121 being line to long in this case)
"let &colorcolumn=join(range(121,999),",")

" color the 'line too long' boundary
highlight ColorColumn guibg=#000000 ctermbg=7

" matches vim clipboard to the default clipboard
set clipboard=unnamed

"sets the key <leader> to ","
let mapleader = ","

"prints out a cat whenever you open vim
echo ">^.^<"

"text no longer wraps back around and relative numbers are placed on the side of the file, numberwidth sets the width of columns that the relative numbers take up
set nowrap number numberwidth=1

"maps <leader>ev to open up the vimrc in a horizontal split (use vsplit for vertical split) think of this as edit vimrc (ev)
nnoremap <leader>ev :split $MYVIMRC<cr>

"map <leader>sv to execute the vimrc file, think of this as source vimrc (sv)
nnoremap <leader>sv :source $MYVIMRC<cr>

"<leader>" will add double quotes around a word in normal mode and leave the cursor at the end of the word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"<leader>' will add single quotes around a word in normal mode and leave the cursor at the end of the word
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

"remap "jk" to escape insert and visual modes
inoremap jk <esc>
vnoremap jk <esc>

"remove mappiing for arrow keys and esc key to force better habits, by setting them to no operation
inoremap <esc> <nop>
nnoremap <left> <nop>
vnoremap <left> <nop>
inoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <right> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
vnoremap <up> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
vnoremap <down> <nop>
inoremap <down> <nop>

"vim tab settings
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" turn hybrid line numbers on
:set number relativenumber
" turn off line numbers for markdown and text files
autocmd FileType markdown,text,vim set nonumber norelativenumber

" When using j or k to jump relatively, add the jump to the 'jumps' list (can now use CTRL-o and CTRL-i)
" this is really useful for when using relativenumber
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" When entering insert mode, relative line numbers are turned off, leaving absolute line numbers turned on
":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END

" highlight line numbers
hi CursorLineNr cterm=bold ctermfg=red ctermbg=white
hi LineNr ctermfg=blue ctermbg=white

"Only search relative to the directory of the current file and in the current directory
set path=.,,**

"map ctrl + direction to change window in that direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file Ag silent! grep! <args>|botright cwindow|redraw!
nnoremap \ :Ag -s<SPACE>
nnoremap <leader>\ :Ag -s <C-R><C-W>

" Create a regex that looks for definitions in ruby and golang
nnoremap g\ :Ag -s '^(module\\|def\\|func\\|class\\|type) .*<C-R><C-W>'<CR>

set switchbuf=vsplit

set wildmenu

" Display extra whitespace
set list listchars=tab:\ \ ,trail:·,nbsp:·
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Some search settings
set incsearch "incremental search
set ignorecase
set hlsearch "highlight search

" Press return to temporarily disable hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

" Use the matchit plugin that vim comes with by default
packadd! matchit

" Have autocompletion behave more normally
set wildmode=longest,list,full

" Folding
set foldmethod=syntax
set foldlevelstart=20

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif
