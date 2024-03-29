"------------------------------------------------------------
" FEATURES

" Explicitly set Vim to use the Vim defaults, not the Vi defaults.
" This helps warding off unexpected behaviour.
set nocompatible

" Allows Vim to determine the type of the file from its file name,
" load the plugin files for specific types and allow inteligent auto-indenting
filetype plugin indent on

" Enable syntax highlighting
syntax enable

"------------------------------------------------------------
" PLUGIN MANAGEMENT

" Set Vim-Plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons' " Keep at the end
call plug#end()

"------------------------------------------------------------
" MUST HAVE OPTIONs

" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" enhanced command-line completion
set wildmenu

" display (partial) command in the last line of the screen.
set showcmd

" Switch on highlighting the last used search pattern.
set hlsearch

" While typing a search command, show where the pattern, as it was typed so far,
" matches.
set incsearch

" Modelines allow you to set variables specific to a file.
" This could be a security vulnerability, so disable this
set nomodeline

" set encoding
set encoding=utf8

" Set vim register to interact with the system's clipboard
set clipboard=unnamed "

"------------------------------------------------------------
" USABILITY OPTIONS

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Put Vim in Paste mode.  This is useful if you want to cut or copy
" some text from one window and paste it in Vim.  This will avoid
" unexpected effects.
set pastetoggle=<F2>

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Show existing tab with 2 space width
set softtabstop=2

" when indenting with '>' use 2 spaces width
set shiftwidth=2

"On pressing tab, insert 4 spaces
set expandtab

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines,
set cmdheight=2

" Set line numbers and relative line numbers on the left
:set number relativenumber

" Make it so relative numbers are the default when in normal mode, and
" 'normal' numbers in insert mode or when the buffer loses focus
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Make it so vim automatically saves and restores folds when a file is closed
" and reopened
augroup AutoSaveFolds
  autocmd!
  au BufWinLeave *.* mkview
  au BufWinEnter *.* silent loadview
augroup END

" This option makes sure the local working directory is correctly set to the
" opened buffer. See https://vi.stackexchange.com/questions/11903/working-directory-different-than-current-file-directory
" TODO: I don't remember why this option and the one below are necessary ->
" test stuff
"set viewoptions -=curdir

" Automatically change the current directory, see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
"autocmd BufEnter * silent! lcd %:p:h

" Set time out length
set timeout timeoutlen=400 ttimeout ttimeoutlen=50

" Set the minimal number of screen lines to keep above and below the cursor.
if !&scrolloff
  set scrolloff=1
endif

" Provide smart autocompletion:
set omnifunc=syntaxcomplete#Complete

" Set lines to wrap if they don't fit inside the window ( or if textwidth is set,
" if it exceeds textwidth length), linebreak option forces vim to wrap lines
" without breaking words
set wrap
set linebreak

" Indent word-wrapped lines as much as the 'parent' line
set breakindent

" Add variable lasttab to be the last tab used, or the first tab if it isn't set
" yet. See <Leader> lt mapping
if !exists( "g:lasttab" )
  let g:lasttab = 1
endif
au TabLeave * let g:lasttab = tabpagenr()

" Show a visual cue at 80 char length
set colorcolumn=80

"------------------------------------------------------------
" VIM FILE LOCATION OPTIONS

" Use undo-dir directory to save undo info
if !isdirectory($HOME."/.vim")
  call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
  call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Prevent .netrwhist file from being created
let g:netrw_dirhistmax=0

" Change viminfo location
set viminfo+=n$HOME/.vim/viminfo

" Set backup and swap files in vimtmp. The trailing '//' ensures the file name
" will be built from the comlete path to the file, with all path separators substituted to
" '%' signs. This will ensure file name uniqueness in the directory.
if !isdirectory($HOME."/.vim/vimtmp")
  call mkdir($HOME."/.vim/vimtmp", "", 0700)
endif
set backupdir=$HOME/.vim/vimtmp//
set directory=$HOME/.vim/vimtmp//

"------------------------------------------------------------
" COLOR OPTIONS

" Add Tmux Color Compatibility
"set t_Co=256

" I have to put this in for termguicolors to work in tmux, incomprehensible
" but see https://github.com/vim/vim/issues/993 , or :h xterm-true-color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set colorscheme
let g:one_allow_italics = 1
colorscheme one
set background=dark

"------------------------------------------------------------
" PLUGIN OPTIONS

"##################################
" COC.NVIM
let g:coc_global_extensions = ['coc-angular', 'coc-json', 'coc-tsserver', 'coc-prettier', 'coc-highlight', 'coc-emmet', 'coc-solargraph', 'coc-html', 'coc-css', 'coc-pairs', 'coc-eslint']

"##################################
" FZF-VIM

" Necessary for macos
set runtimepath+=$HOMEBREW_PREFIX/opt/fzf
"
" Redeclare Rg command so that it uses a preview window
" TODO there is still an issue with the highlighting color from Rg but I'm
" sick of looking
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"##################################
"LIGHTLINE

" Change lightline plugin color
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }

"##################################
" MATCHIT

" Add matchit plugin to extend the behaviour of '%'
packadd! matchit

"##################################
"NERDTREE

" NERDTree File highlighting (for vim-devicons)

" conceallevel removes brackets around icons (normally at 2)
set conceallevel=3

" Show hidden files
let NERDTreeShowHidden=1

" get rid of [  ] around icons in NerdTree
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

"------------------------------------------------------------
" MAPPINGS

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" set Leader
let g:mapleader=","

" Use <esc> to clear the highlighting of :set hlsearch.
" Explanation of why we need the second line:
" When built with the +termresponse feature, Vim sends a special control sequence (see :set t_RV?) to the terminal. When your terminal emulator see this sequence it responds with the sequence ESC ]>1;3201;0c. The ESC is mapped to :noh and you get the rest of the sequence on the command line. With the OP’s mapping the rest of the sequence is taken as normal commands, thus the last c starts a change command. So, this ESC mapping is interfering with a query response that xterm (or whatever) is giving to Vim. Chris Johnsen (https://stackoverflow.com/questions/15014923/why-is-vim-starting-in-delete-mode/15015109#15015109)
nnoremap <silent><esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" remap j and k so that they don't skip a single line visually represented as
" several
nnoremap j gj
nnoremap k gk

" Remap CTRL + w to <Leader> + w
:nnoremap <Leader>w <C-w>

" Easier split resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Remap NERDTree autofocus
nmap <Leader>t :NERDTreeToggle<CR>

" <Leader>lt makes you switch to the last tab that was opened
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>

" Move tabs left and right using <Leader> + direction
noremap <Leader>h  :tabmove -1<CR>
noremap <Leader>l :tabmove +1<CR>

" Trim whitespace with F5
noremap <F5> :call TrimWhitespace()<CR>

" Call fzf faster with CTRL + p
nnoremap <C-p> :Files<Cr>

" Call :Buffer with a convenient mapping
nnoremap <Leader>b :Buffer<Cr>

" Call Rg faster with leader + g
nnoremap <Leader>g :Rg<Cr>
"------------------------------------------------------------
" SOURCING SUB-CONFIGS

" Add vimrc_coc config
source $HOME/.vimrc_coc_config

"------------------------------------------------------------
" DEFINE USER FUNCTIONS

" Trim trailing whitespace
" 1) fun! => ! would overwrite previously defined functions w/ the same name,
" we use it for safety
" 2) The winsaveview() will save the current "view", which includes the cursor
" position, folds, jumps, etc. The winrestview() at the end will restore this
" from the saved variable.
" 3) The :keeppatterns prevents the \s\+$ pattern from being added to the search history.
" The last-used search term is automatically restored after leaving a function,
" so we don't have to do anything else for this.
" 4) The substitute pattern matches whitespace (/s) once or more (\+) until eol ($)
" and the e flag means not to throw an error if there is no whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" For scss syntax, see https://github.com/neoclide/coc-css
autocmd FileType scss setl iskeyword+=@-@
