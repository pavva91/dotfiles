"            $$\                                   
"            \__|                                  
" $$\    $$\ $$\ $$$$$$\$$$$\   $$$$$$\   $$$$$$$\ 
" \$$\  $$  |$$ |$$  _$$  _$$\ $$  __$$\ $$  _____|
"  \$$\$$  / $$ |$$ / $$ / $$ |$$ |  \__|$$ /      
"   \$$$  /  $$ |$$ | $$ | $$ |$$ |      $$ |      
" $$\\$  /   $$ |$$ | $$ | $$ |$$ |      \$$$$$$$\ 
" \__|\_/    \__|\__| \__| \__|\__|       \_______|
                                                 
" -----------------------------------------------------------------------------------
" COLORS AND SYNTAX HIGHLIGHT
" -----------------------------------------------------------------------------------
" Enable syntax highlighting
syntax enable

filetype plugin on

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set Mouse
set mouse=a

" -----------------------------------------------------------------------------------
" TAB
" -----------------------------------------------------------------------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" -----------------------------------------------------------------------------------
" LINE NUMBERS
" -----------------------------------------------------------------------------------
set number              " show line numbers
set relativenumber	    " show relative line numbers	

" -----------------------------------------------------------------------------------
" VISUALS
" -----------------------------------------------------------------------------------
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
"set termguicolors
" Search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
set pastetoggle=<F2>
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
" => Status line
" -----------------------------------------------------------------------------------

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" space open/closes folds
nnoremap <space> za

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" -----------------------------------------------------------------------------------
" MAPPINGS
" -----------------------------------------------------------------------------------

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

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
nnoremap <leader><space> :nohlsearch<CR>

" Replace all is aliased to S
nnoremap S :%s//g<left><left>

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" buffer search shortcut
nnoremap gb :ls<cr>:b<space>

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

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Toggle Vexplore with Ctrl-O
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()

        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile

            close
        endif

        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction
map <F3> :call ToggleVExplorer()<CR>

" -----------------------------------------------------------------------------------
" => PLUG
" -----------------------------------------------------------------------------------
call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"a Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" --- Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" --- Start Page
Plug 'mhinz/vim-startify'

" --- Auto close parenthesys
Plug 'jiangmiao/auto-pairs'


" --- Surrounding (e.g: surround 1 word with '()': ysw), surround 2 lines with '{}' ys2j} )
"  ysw( : surround 1 word with '(   )' with heading and trailing spaces
"  cs"' - Change "hello" to 'hello'
Plug 'tpope/vim-surround' " ys

" --- Commentary Toggle (gcc : comment line, gc : comment selection)
Plug 'tpope/vim-commentary'

" --- Ranger File Manager
Plug 'https://github.com/francoiscabrol/ranger.vim'
" --- Ranger dependency
Plug 'rbgrouleff/bclose.vim'
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


" -----------------------------------------------------------------------------------
" => NERDTREE
" -----------------------------------------------------------------------------------
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

map <F3> :NERDTreeToggle<CR>
" -----------------------------------------------------------------------------------
" => MAPPINGS
" -----------------------------------------------------------------------------------
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
nnoremap <leader>r :RangerCurrentDirectory<CR>
nnoremap <leader>g :GFiles<CR>
" Ag on CWD
nnoremap <leader>ag :Ag<CR>
" Rip Grep on CWD
nnoremap <leader>rg :Rg<CR>
" FZF by file name without file preview on CWD
nnoremap <leader>fz :FZF<CR>
" FZF by file name with file preview on CWD
nnoremap <leader>ff :Files<CR>
nnoremap <C-p> :Files<CR>
" Fuzzy find string in current open file
nnoremap <leader>fb :BLines<CR>
nnoremap g/ :BLines<CR>
" Fuzzy find string in files in buffer
nnoremap <leader>fl :Lines<CR>
nnoremap g? :Lines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History:<CR>
nnoremap <leader>s :Startify<CR>
