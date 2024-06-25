" -----------------------------------------------------------------------------------
" COLORS AND SYNTAX HIGHLIGHT
" -----------------------------------------------------------------------------------
" Enable syntax highlighting
filetype plugin on
syntax enable

let g:mapleader = " "

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

set timeoutlen=500

" -----------------------------------------------------------------------------------
" TAB
" -----------------------------------------------------------------------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set smartindent

" -----------------------------------------------------------------------------------
" LINE NUMBERS
" -----------------------------------------------------------------------------------
set number              " show line numbers
set relativenumber	    " show relative line numbers

" -----------------------------------------------------------------------------------
" LINE NUMBERS
" -----------------------------------------------------------------------------------
set wildmenu            " visual autocomplete for command menu
set wildoptions=pum     " vertical autocompletion

" -----------------------------------------------------------------------------------
" VISUALS
" -----------------------------------------------------------------------------------
set fillchars=vert:\   " removes pipes on split separators
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
"set termguicolors
" Search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set pastetoggle=<F2>
set signcolumn=yes " extra column for linting
set hidden
set wrap

filetype indent on      " load filetype-specific indent files

" -----------------------------------------------------------------------------------
" SEARCH
" -----------------------------------------------------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" -----------------------------------------------------------------------------------
" SPLIT
" -----------------------------------------------------------------------------------
set splitbelow
set splitright
" -----------------------------------------------------------------------------------
" FOLDING
" -----------------------------------------------------------------------------------
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" -----------------------------------------------------------------------------------
" WILD MENU
" -----------------------------------------------------------------------------------
set wildoptions=pum     " vertical autocompletion

" -----------------------------------------------------------------------------------
" => Status line
" -----------------------------------------------------------------------------------

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" -----------------------------------------------------------------------------
" => Show the 80th Column
" -----------------------------------------------------------------------------
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" -----------------------------------------------------------------------------------
" => Helper functions
" -----------------------------------------------------------------------------------
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


" -----------------------------------------------------------------------------------
" => CONFIG NETRW FILE EXPLORER
" -----------------------------------------------------------------------------------

" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" " Toggle Vexplore with Ctrl-O
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
" map <F3> :call ToggleVExplorer()<CR>

" -----------------------------------------------------------------------------------
" MAPPINGS
" -----------------------------------------------------------------------------------

" space open/closes folds
nnoremap <space> za

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" highlight last inserted text
nnoremap gV `[v`]

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" turn off search highlight
nnoremap <leader>, :nohlsearch<CR>

" Replace all is aliased to S
nnoremap S :%s//g<left><left>

" nnoremap <TAB> :bnext<CR>
" nnoremap <S-TAB> :bprevious<CR>

" buffer search shortcut
nnoremap gb :ls<cr>:b<space>

" buffer search shortcut and open in vertical split
nnoremap gB :ls<cr>:vert sb<space>

" quit current open buffer and switch to previous buffer
nmap <leader>bq :bp <BAR> bd #<cr>

" yank into selection without swapping default register ("")
" vnoremap <leader>p "_dP

" substitute selection by yank by using yank register
vnoremap <leader>p d"0P

" yank by using yank register
nnoremap <leader>p "0p

" yank to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" yank all buffer to clipboard
nnoremap <leader>Y gg"+yG

" move selection up/down (with autoindent)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" -----------------------------------------------------------------------------------
" => Spell checking
" -----------------------------------------------------------------------------------
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Shortcuts buffer traversing
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Project Tree Toggle
nnoremap <leader>pt :Vex<CR>
" nnoremap <leader>fp :Ex %:h<CR>
nnoremap <leader>pf :Ex %:h<CR>
nnoremap <leader>po :Ex %:h<CR>

nnoremap <leader>ww :w<CR>

" sort selection
vnoremap <leader>s :sort<CR>

" scrolling remaps
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

inoremap jk <ESC>
inoremap kj <ESC>
