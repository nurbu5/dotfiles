" font: InputMono 14 pt.
""""""""""fzf settings""""""""""
" Don't forget to install fzf using homebrew

"Change the default mapping and the default command to invoke CtrlP
set rtp+=/usr/local/opt/fzf

map <c-p> :FZF<cr>

" To install fzf use brew install fzf
" site: https://github.com/junegunn/fzf#as-vim-plugin

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
let &colorcolumn=join(range(121,999),",")

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

" When using j or k to jump relatively, add the jump to the 'jumps' list (can now use CTRL-o and CTRL-i)
" this is really useful for when using relativenumber
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" When entering insert mode, relative line numbers are turned off, leaving absolute line numbers turned on
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

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
