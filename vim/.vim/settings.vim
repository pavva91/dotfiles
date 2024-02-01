" Enable syntax highlighting
filetype plugin on
syntax on

let g:mapleader = " "

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set Mouse
set mouse=a

set timeoutlen=500

" -----------------------------------------------------------------------------
" COLORSCHEMES
" -----------------------------------------------------------------------------
set termguicolors
colorscheme gruvbox
set background=dark
let ayucolor="dark"   " for dark version of ayu theme

" -----------------------------------------------------------------------------
" TAB
" -----------------------------------------------------------------------------
" Set indentation width of 4 spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set smartindent

" Set indentation width of 2 spaces
" set autoindent expandtab tabstop=2 shiftwidth=2


" -----------------------------------------------------------------------------
" LINE NUMBERS
" -----------------------------------------------------------------------------
set number              " show line numbers
set relativenumber	    " show relative line numbers

" -----------------------------------------------------------------------------
" WILD MENU (EX MODE AUTOCOMPLETION)
" -----------------------------------------------------------------------------
set wildmenu            " visual autocomplete for command menu
set wildoptions=pum     " vertical autocompletion
" set wildoptions=tagfile " horizontal autocompletion


" -----------------------------------------------------------------------------
" VISUALS
" -----------------------------------------------------------------------------
set fillchars=vert:\   " removes pipes on split separators
" set fillchars+=vert:\   " removes pipes on split separators
" set fillchars+=vert:\│   " use │ on split separators
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]

" Search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**

set pastetoggle=<F2>

set signcolumn=yes " extra column for linting

" keeps any buffer in the background (keeps everything open) (can use :bnext,
" :bprevious without issues of having to either :w or e! the buffer)
set hidden

" Visual Wrapping
set wrap
" autocmd FileType python set breakindentopt=shift:4

" Enable indentationn
filetype indent on      " load filetype-specific indent files

" The cursor in insert mode is visible and fixed
" set guicursor=

" try fix guicursor
" set guicursor=n-v-c:block-Cursor/lCursor
" set guicursor+=ve:ver35-Cursor
" set guicursor+=o:hor50-Cursor
" set guicursor+=i-ci:ver25-Cursor/lCursor
" set guicursor+=r-cr:hor20-Cursor/lCursor
" set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" -----------------------------------------------------------------------------
" SEARCH
" -----------------------------------------------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" -----------------------------------------------------------------------------
" SPLIT
" -----------------------------------------------------------------------------
set splitbelow
set splitright

" -----------------------------------------------------------------------------
" FOLDING
" -----------------------------------------------------------------------------
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" -----------------------------------------------------------------------------
" => Status line
" -----------------------------------------------------------------------------

let g:currentmode={
    \ 'n'      : 'Normal ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'Visual ',
    \ 'V'      : 'V-Line ',
    \ '\<C-V>' : 'V-Block ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S-Line ',
    \ '\<C-S>' : 'S-Block ',
    \ 'i'      : 'Insert ',
    \ 'R'      : 'Replace ',
    \ 'Rv'     : 'V-Replace ',
    \ 'c'      : 'Command ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}

function! GitInfo()
    let git = FugitiveHead()
    if git != ''
        return ' '.FugitiveHead()
    else
        return ''
    endif
endfunction

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    if (mode() =~# '\v(n|no)')
        exe 'hi! StatusLine ctermfg=004'
    elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
        exe 'hi! StatusLine ctermfg=005'
    elseif (mode() ==# 'i')
        exe 'hi! StatusLine ctermfg=002'
    else
        exe 'hi! StatusLine ctermfg=006'
    endif

    return ''
endfunction

" Always show the status line
set laststatus=2

" Format the status line
set statusline=
set statusline+=\
set statusline+=%{ChangeStatuslineColor()}                  " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}      "Vim Mode"
set statusline+=%{HasPaste()}
set statusline+=%{GitInfo()}                                "Current Git Branch"
set statusline+=\ %F%m%r%h\                                 "Open Buffer Filepath"
set statusline+=%w\                                         "filestatus"
set statusline+=\ CWD:\ %r%{getcwd()}%h\                    "Current Working Directory"
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                    " Rownumber/total (%)

" space open/closes folds
nnoremap <space> za

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Give more space for displaying messages.
" set cmdheight=2

" -----------------------------------------------------------------------------
" Primeagen Opions
" -----------------------------------------------------------------------------
"  VimRC Structure:
"  1. set
"  2. plugins (Plug)
"  3. editor settings
"  4. let
"  5. remaps
"  6. autocommands
" if you do vim . in a directory that contains a .vimrc it will is that
set exrc

" no error sounds
set noerrorbells

" How to keep history (undotree plugin)
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" highlight Normal guibg=none
" prefferred plugins:
" nvim-lsp
" telescope (only for nvim)
" treesitter
" gruvbox (theme)
" undotree
" fugitive (git integration)
"

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Trim trailing whitespace on save
augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" -----------------------------------------------------------------------------
" => Show the 80th Column
" -----------------------------------------------------------------------------
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" -----------------------------------------------------------------------------
" SPELL CHECKING
" -----------------------------------------------------------------------------
" Spell Checking
" set spell

" -----------------------------------------------------------------------------
" => Helper functions
" -----------------------------------------------------------------------------
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


" -----------------------------------------------------------------------------
" => CONFIG NETRW FILE EXPLORER
" -----------------------------------------------------------------------------

" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" let g:netrw_dirhistmax  =10
" let g:netrw_dirhistcnt =1
" let g:netrw_dirhist_1='/home/bob'

" TOGGLE VEXPLORE
" function! ToggleVExplorer()
"     if exists("t:expl_buf_num")
"         let expl_win_num = bufwinnr(t:expl_buf_num)
"         let cur_win_num = winnr()

"         if expl_win_num != -1
"             while expl_win_num != cur_win_num
"                 exec "wincmd w"
"                 let cur_win_num = winnr()
"             endwhile

"             close
"         endif

"         unlet t:expl_buf_num
"     else
"          Vexplore
"          let t:expl_buf_num = bufnr("%")
"     endif
" endfunction
