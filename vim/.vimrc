" Don't forget to install fzf using homebrew
"
"
"This is a comment

"In order to run plugins that can be found under .vim
execute pathogen#infect()

""""""""""fzf settings""""""""""
"Change the default mapping and the default command to invoke CtrlP
set rtp+=/usr/local/opt/fzf

map <c-p> :FZF<cr>

" To install fzf use brew install fzf
" site: https://github.com/junegunn/fzf#as-vim-plugin

"""""""""""""""""""""""""""""""""""

"Ctags setting
set tags=/Users/dawasherpa/projects/biggerpockets/tags

"Allow jsx syntax highlighting in .js files
let g:jsx_ext_required = 0

"When invoked, unless a starting directory is specified, CtrlP will set its
"local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

"""""""""""Language/Framework specific"""""""""""

"For ruby on rails, syntax highlighting,  and indent
syntax on
filetype plugin indent on

"Javascript syntax highlighting rules

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:jsx_ext_required = 0


"""""""""""""""""""""""""""""""""""""""""""""""""

"sets the key <leader> to ","
let mapleader = ","

"set the key <localleader> to "\", note we use \\ becuause "\" is the escape character
let maplocalleader = "\\"

"prints out a cat whenever you open vim
echo ">^.^<"

"text no longer wraps back around and relative numbers are placed on the side of the file, numberwidth sets the width of columns that the relative numbers take up
set nowrap number numberwidth=1

"maps the '-' key so that it deletes the current line (dd), then pastes it in the line below the current line (p)
noremap <leader>- ddp

"maps the '_' key so that it deletes the current line (dd), then pastes it in the line above the current line (kkp)
noremap <leader>_ ddkkp

"maps ctrl-u to uppercase the current word under the cursor in insert mode <esc> is equivalent to hitting the <esc> key
inoremap <leader><c-u> <esc>llbveUi

"maps ctrl-u to uppercase the current word under the cursor in normal mode
nnoremap <leader><c-u> lbveU

"by using *noremap instead of *map, the mappings don't take into consideration other mappings, and only use the default commands for the keys

"maps <leader>ev to open up the vimrc in a horizontal split (use vsplit for vertical split) think of this as edit vimrc (ev)
nnoremap <leader>ev :split $MYVIMRC<cr>

"map <leader>sv to execute the vimrc file, think of this as source vimrc (sv)
nnoremap <leader>sv :source $MYVIMRC<cr>

"add abbreviations
"when I type @e in insert mode, it will expand to dsherpa@mymail.mines.edu
iabbrev @e dsherpa@mymail.mines.edu

iabbrev @s -- <cr>Dawa Nurbu Sherpa<cr>

"abbreviations for common typos
iabbrev adn and
iabbrev tehn then
iabbrev waht what
iabbrev Sherap Sherpa

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

"Turn filetype detection on, in order to use filetype event in autocommand
filetype on

"group all of the autocmds
augroup rccommands

    "autocommands for commenting using <localleader>c in some common programming languages
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType php nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType html nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
    autocmd FileType css nnoremap <buffer> <localleader>c I/*<esc>A*/<esc>

    "autocommands for set options in specific programming languages
    autocmd FileType javascript setlocal nu
     
    "autocommand abbreviations for if statements in certain languages
    autocmd FileType javascript iabbrev <buffer> iff if (){<cr><cr>} 
    autocmd FileType python iabbrev <buffer> iff if:<cr> 

    "autocommand abbreviations for php settings, macros, and abbreviations
    autocmd FileType php,html nnoremap <buffer> <localleader>f Vypa/<esc>

"end augroup
augroup END

"vim tab settings
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"autocommand grouping, used so that autocommands aren't duplicated.
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

"abbreviations for greek symbols
iabbrev alpha α
iabbrev beta β
iabbrev delta δ
iabbrev epsilon ε
iabbrev gamma γ
iabbrev Sigma Σ
iabbrev Gamma Γ



"PERSONAL/CUSTOM
"map ctrl + direction to change window in that direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

