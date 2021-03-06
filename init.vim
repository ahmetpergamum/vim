" vimrc conf file for vim and vim-plug

" color schemes require 256-bit gnome-terminal
"
set t_Co=256

set nocompatible              " required
" to get the airline plugin
set laststatus=2
set relativenumber

filetype off                  " required

" Specify a directory for plugins
"  - For Neovim: ~/.local/share/nvim/plugged
"  - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" All of your Plugins must be added before the following line
Plug 'Valloric/YouCompleteMe'

"Code Folding
Plug 'tmhedberg/SimpylFold'

"Auto-Indentation
Plug 'vim-scripts/indentpython.vim'
"Python autocomplete
Plug 'davidhalter/jedi-vim'
"Python sytax checker
Plug 'scrooloose/syntastic'
"PEP8 checking
Plug 'nvie/vim-flake8'
"Colors
Plug 'flazz/vim-colorschemes'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
"Plug 'junegunn/rainbow_parentheses.vim'
"Ctrl-n to enable filesystem
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
"Ctrl-P to enable the search and then just start typing
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
"status bar that displays things
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"markdown plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"latex plugin
Plug 'lervag/vimtex'
"vim easy align plugin
Plug 'junegunn/vim-easy-align'
"highlight overused words
Plug 'dbmrq/vim-ditto'
"js syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript'
"js code completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" easy coding html css
Plug 'mattn/emmet-vim'
"ALE (Asynchronous Lint Engine) is a plugin providing linting
"(syntax checking and semantic errors)
"in NeoVim 0.2.0+ and Vim 8
Plug 'dense-analysis/ale'
" Prettier code formatting plugin installed with coc
" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-demand loading
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" Plug 'fatih/vim-go', { 'tag': '*' }
"
" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
" Plug '~/my-prototype-plugin'
"
call plug#end()

filetype plugin indent on    " enables filetype detection

":sv <filename> and you split the layout vertically
":vs <filename> and you get a horizontal split
"specify different areas of the screen where the splits should occur
set splitbelow
set splitright
"move between the splits without using the mouse
"split navigations with Ctrl-k and Ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-n> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=19


"Enable folding
set foldmethod=indent
set foldlevel=99

"I don't like swap files
set noswapfile

" Enable folding with the spacebar
nnoremap <space> za

" enhance YCM JS completion with tern's smarts
"autocmd FileType javascript setlocal omnifunc=tern#Complete

"Enables syntax highlighting for JSDoc NGDocs and Flow
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" coc.vim get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" automatically change the working dir
" set autochdir
" if it does not work with some plugins use
" autocmd BufEnter * silent! lcd %:p:h
" manual command to change vim dir
" :cd %:p:h
"
" shortcut for changing dir in normal mode type \cd
" after cd it also show the dir for checking
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


"tabs
au BufNewFile,BufRead *.py,*.tex
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
	\ set colorcolumn=81

set tabstop=2
set softtabstop=2
set shiftwidth=2
"set textwidth=80
"set colorcolumn=81

"Flagging Unnecessary Whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h
"create a new highlight group to highlight unwanted tabs and trailing spaces
highlight BadWhitespace ctermbg=red guibg=darkred
highlight UnwanttedTab ctermbg=red guibg=darkred
highlight TrailSpace guibg=red ctermbg=darkred
match BadWhitespace /\s\+$/
match UnwanttedTab /\t/
match TrailSpace / \+$/

autocmd ColorScheme * highlight BadWhitespace ctermbg=red guibg=darkred
autocmd ColorScheme * highlight UnwanttedTab ctermbg=red guibg=darkred
autocmd ColorScheme * highlight TrailSpace guibg=red ctermbg=darkred

" open NERDTree and
au vimenter *  NERDTree " older one
" move the cursor to the file editing area
autocmd VimEnter * wincmd p

set encoding=utf-8

"make your code look pretty
let python_highlight_all=1
syntax on

"Check out solarized for GUI mode, and Zenburn for terminal mode
if has('gui_running')
	set background=dark
	colorscheme gruvbox
	"colorscheme solarized
else
	"colorscheme distinguished
	colorscheme solarized
	"colorscheme palenight

	"set background=dark

	"set termguicolors     " enable true colors support
	"let ayucolor="light"  " for light version of theme
	"let ayucolor="mirage" " for mirage version of theme
	"let ayucolor="dark"   " for dark version of theme
	"colorscheme ayu

	"colorscheme gruvbox
	set background=dark    " Setting dark mode
	"set background=light   " Setting light mode

	" Unified color scheme (default: dark)
	" seoul256 (dark):
	"   Range:   233 (darkest) ~ 239 (lightest)
	"   Default: 237
	"let g:seoul256_background = 233
	"colo seoul256
	" Light color scheme
	" seoul256 (light):
	"   Range:   252 (darkest) ~ 256 (lightest)
	"   Default: 253
	"let g:seoul256_background = 254
	"colo seoul256-light

	"colorscheme zenburn
endif

" toggle background colour
call togglebg#map("<F5>")

"hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"see the docstrings for folded code
"let g:SimpylFold_docstring_preview=1

"Line Numbering
set nu

" make backspaces more powerfull
set backspace=indent,eol,start

"CUSTOM KEY MAPPINGS
"navigate between tabs
"map <F8> :tabp<CR>
"map <F9> :tabn<CR>
"map keys so python executes current script
map <C-s> :w<CR>:!python %<CR>
"map <C-d> :w<CR>:!python3 %<CR>
"map Ctrl+s to write file and run it by pyton
imap <C-s> <Esc>:w<CR>:!python %<CR>
imap <C-d> <Esc>:w<CR>:!python3 %<CR>
" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon
"Enter to insert a new-line after the current line
"Ctrl-o for "inserting a line before the current line
"stay in the line where you have been before with "j" and "k"
nmap <C-o> O<Esc>j
nmap <CR> i<CR><Esc>
"comment lines easily in normal(command) mode
"with <F3> and <F4>
nmap <F3> 0i//<Space><Esc>h
nmap <F4> <End>a<Tab><Tab>//<Space>

au BufNewFile,BufRead *.tex
	\ nmap <F3> 0i%<Space><Esc>h |
	\ nmap <F4> <End>a<Tab><Tab>%<Space>

"disable vimtex warnings
let g:vimtex_compiler_latexmk = {'callback' : 0}

"enable error navigation with ":lnext" and "lprev" commands
let g:syntastic_always_populate_loc_list = 1
"let g:ycm_always_populate_location_list = 1

"enable omnicompletion
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete
"imap <C-a> <C-X><C-O>

"ayu colors indentation
"IndentLine {{
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_setColors = 0
" }}

" Goyo dimensions
" Both
"Goyo 120x30
"Goyo.vim limelight integration
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off
" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches
" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" set paste and nopaste toggle to paste clipboard stuff
set pastetoggle=<F2>

" select all lines with ctrl-A
map <C-a> <esc>ggVG<CR>

" highlight the cursor line
set cursorline
hi Cursor ctermbg=172

" vim autocomplete settings
set completeopt=longest,menuone,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" set dictionary: it works with ctrl+x default
set dictionary+=/usr/share/dict/words

" Add 'k' to the list to enable dictionary completion without ctrl+x for latex files
set complete+=k

"remap the default emmet leader key <C-Y> to <C-Z>:
"let g:user_emmet_leader_key='<C-Z>'
"
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" run prettier while saving the file
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
