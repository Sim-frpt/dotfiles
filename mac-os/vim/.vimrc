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
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
"Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons' " Keep at the end
call plug#end()

"------------------------------------------------------------
" MUST HAVE OPTIONs

" One such option is the 'hidden' option, which allows you to re-use the same window and switch from an unsaved buffer without saving it first. Also allows
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
set clipboard=unnamed

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

" Width of a hard tabstop measured in spaces
set tabstop=4

" The size of an indent
set shiftwidth=4

"On pressing tab, insert 4 spaces
set expandtab

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

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
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Make it so vim automatically saves and restores folds when a file is closed
" and reopened
" TODO temporarily commented out cause I don't know if I'll need it 
"augroup AutoSaveFolds
"autocmd!
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview
"augroup END

" Set time out length
set timeout timeoutlen=400 ttimeout ttimeoutlen=50

" Set the minimal number of screen lines to keep above and below the cursor.
" Same for sideScroll.
if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
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

augroup setlasttab
    autocmd!
    autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

" Show a visual cue at 80 char length
set colorcolumn=80

set backup

"------------------------------------------------------------
" VIM SENSIBLE OPTIONS

" The i option states that it will “scan current and included files”, which might pollute the autocomplete results if your current file includes a lot of other files. As such, it makes sense to disable this option.
set complete-=i

" nrformats is short for number formats. The octal option will cause 007 to be incremented to 010 due to using base 8. In normal usage, this is not the expected behaviour since not a lot of people are using base 8 in their daily work. By disabling it, 007 will be incremented to 008.
set nrformats-=octal

set display+=lastline

" When using list option, changes the characters that will be displayed for
" specific characters.
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" tags command defines the file names for the tag command. What the line does is to remove ./tags and ./tags; from the current tags. The ^= command prepends the value ./tags; into the current tags.
" With this ./tags;, if Vim finds a tags file in the directory of the current file, it won't look any further.
if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" This will make Vim automatically read a file when it detects that the file has been changed outside of Vim
set autoread

if &history < 1000
    set history=1000
endif
if &tabpagemax < 50
    set tabpagemax=50
endif

" Viminfo is a file that is written automatically by Vim as sort of a “cache” to remember information such as command line history, search string hitory, last search pattern, global variables, etc. This line will prepend the ! value, which will save and restore global variables that start with uppercase letter and don’t have any lowercase letter in them.
if !empty(&viminfo)
    set viminfo^=!
endif

" Removing the options value from sessionoptions will disable saving of options, mappings, and global values when you use :mksession to make a session. Same for views
set sessionoptions-=options
set viewoptions-=options

" These two lines will prevent accidental deletion without the possibility of doing undo with both Ctrl+U and Ctrl+W.
" By doing Ctrl+G u before the actual Ctrl+U or Ctrl+W, we can recover our deleted text with the undo operation (u in Normal mode), which is not possible without these remaps
if empty(mapcheck('<C-U>', 'i'))
    inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
    inoremap <C-W> <C-G>u<C-W>
endif

"------------------------------------------------------------
" VIM FILE LOCATION OPTIONS

" Use undo-dir directory to save undo info see https://vi.stackexchange.com/questions/6/how-can-i-use-the-undofile
" I might have to clean this undo-dir sometime, since it does not auto-clean
" itself
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif

if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

set undodir=~/.vim/undo-dir
set undofile

" Prevent .netrwhist file from being created. netrw is the default vim file
" explorer
let g:netrw_dirhistmax=0

" Change viminfo location
set viminfo+=n$HOME/.vim/viminfo

" Set backup and swap files in vimtmp. The trailing '//' ensures the file name
" will be built from the comlete path to the file, with all path separators substituted to
" '%' signs. This will ensure file name uniqueness in the directory.
if !isdirectory($HOME."/.vim/vimtmp")
    call mkdir($HOME."/.vim/vimtmp", "", 0700)
endif
set backupdir^=$HOME/.vim/vimtmp//
set directory^=$HOME/.vim/vimtmp//

"------------------------------------------------------------
" COLOR OPTIONS

" Needed to get terminal pretty colours, see https://stackoverflow.com/questions/62702766/termguicolors-in-vim-makes-everything-black-and-white
if exists('+termguicolors')
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
"let g:coc_global_extensions = ['coc-angular', 'coc-json', 'coc-tsserver', 'coc-prettier', 'coc-highlight', 'coc-emmet', 'coc-solargraph', 'coc-html', 'coc-css', 'coc-pairs', 'coc-eslint']

" For scss syntax, see https://github.com/neoclide/coc-css
"autocmd FileType scss setl iskeyword+=@-@


"##################################
" FZF-VIM

let g:terminal_ansi_colors = [
            \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
            \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
            \ '#626262', '#d75f87', '#87af87', '#ffd787',
            \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
            \ ]

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
"" Redeclare Rg command so that it uses a preview window
"" TODO there is still an issue with the highlighting color from Rg but I'm
"" sick of looking
"command! -bang -nargs=* Rg
            "\ call fzf#vim#grep(
            "\   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
            "\   fzf#vim#with_preview(), <bang>0)

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

" Show hidden files
let NERDTreeShowHidden=1

" get rid of [  ] around icons in NerdTree
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

"##################################
" NERDCOMMENTER
 let g:NERDSpaceDelims = 1

"------------------------------------------------------------
" MAPPINGS

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" set Leader
let g:mapleader=","

" Use <esc> to clear the highlighting of :set hlsearch.
" Explanation of why we need the second line:
" When built with the +termresponse feature, Vim sends a special control sequence (see :set t_RV?) to the terminal. When your terminal emulator see this sequence it responds with the sequence ESC ]>1;3201;0c. The ESC is mapped to :noh and you get the rest of the sequence on the command line. With the OP’s mapping the rest of the sequence is taken as normal commands, thus the last c starts a change command. So, this ESC mapping is interfering with a query response that xterm (or whatever) is giving to Vim. Chris Johnsen (https://stackoverflow.com/questions/15014923/why-is-vim-starting-in-delete-mode/15015109#15015109). also see https://stackoverflow.com/questions/11940801/mapping-esc-in-vimrc-causes-bizarre-arrow-behaviour/20458579#20458579
nnoremap <silent><esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" remap j and k so that they don't skip a single line visually represented as
" several
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Remap CTRL + w to <Leader> + w
:nnoremap <Leader>w <C-w>

" Easier split resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Remap NERDTree toggle
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

" Highlight current file in nerdtree
nnoremap <C-f> :NERDTreeFind<CR>

"------------------------------------------------------------
" SOURCING SUB-CONFIGS

" Add vimrc_coc config
"source $HOME/.vimrc_coc_config

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
