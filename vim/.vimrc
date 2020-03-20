"------------------------------------------------------------
" Features

" Explicitly set Vim to use the Vim defaults, not the Vi defaults.
" This helps warding off unexpected behaviour.
set nocompatible

" Allows Vim to determine the type of the file from its file name,
" load the plugin files for specific types and allow inteligent auto-indenting
filetype indent plugin on

" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options

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

"------------------------------------------------------------
" Usability options

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

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

" Set time out length
set timeout timeoutlen=400 ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Set the minimal number of screen lines to keep above and below the cursor.
if !&scrolloff
  set scrolloff=1
endif

" Add Tmux Color Compatibility
set t_Co=256

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
" Vim file location options

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
set backupdir=$HOME/.vim/vimtmp//
set directory=$HOME/.vim/vimtmp//

"------------------------------------------------------------
" Indentation options

" set tabstop and shiftwidth to 2 and enable expandtab
set shiftwidth=2
set softtabstop=2
set expandtab

"------------------------------------------------------------
" Color options

" Set colorscheme
colorscheme gruvbox
set background=dark

" change highlight search color
hi Search cterm=NONE ctermfg=Black ctermbg=DarkMagenta
hi IncSearch cterm=underline,bold ctermfg=White ctermbg=DarkMagenta

"------------------------------------------------------------
" Plugins options

" Set Pathogen plugin manager
execute pathogen#infect()

"##################################
"LIGHTLINE

" Change lightline plugin color
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }
"
"##################################
"INDENTLINE

" Set indentLine character and color
let g:indentLine_char = ''
" Make it grey, not blue
" let g:indentLine_setColors = 0

"##################################
"NERDTREE

" NERDTree File highlighting (for vim-devicons)
" conceallevel removes brackets around icons (normally at 2)
set conceallevel=3

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

"##################################
"FZF-VIM
set runtimepath+=$HOME/.fzf

"------------------------------------------------------------
" Mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" set Leader
let g:mapleader=","

" Use <esc> to clear the highlighting of :set hlsearch.
" Explanation of why we need the second line:
" When built with the +termresponse feature, Vim sends a special control sequence (see :set t_RV?) to the terminal. When your terminal emulator see this sequence it responds with the sequence ESC ]>1;3201;0c. The ESC is mapped to :noh and you get the rest of the sequence on the command line. With the OP’s mapping the rest of the sequence is taken as normal commands, thus the last c starts a change command. So, this ESC mapping is interfering with a query response that xterm (or whatever) is giving to Vim. Chris Johnsen (https://stackoverflow.com/questions/15014923/why-is-vim-starting-in-delete-mode/15015109#15015109)
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" remap j and k so that they don't skip a single line visually represented as
" several
nnoremap j gj
nnoremap k gk

" Autoclosing tags
"inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Remap CTRL + w to <Leader> + w
:nnoremap <Leader>w <C-w>

" Remap NERDTree autofocus
nmap <Leader>t :NERDTreeToggle<CR>

" <Leader>lt makes you switch to the last tab that was opened
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>

" add mapping to move tabs left and right using <Leader> + direction
noremap <Leader>h  :tabmove -1<CR>
noremap <Leader>l :tabmove +1<CR>

" Trim whitespace with F5
noremap <F5> :call TrimWhitespace()<CR>

" Call fzf faster with CTRL + p
nnoremap <C-p> :Files<Cr>

"------------------------------------------------------------
" Sourcing sub configs

" Add vimrc_coc config
source $HOME/.vimrc_coc_config

"------------------------------------------------------------
" Define user functions

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
