"            $$\
"            \__|
" $$\    $$\ $$\ $$$$$$\$$$$\   $$$$$$\   $$$$$$$\
" \$$\  $$  |$$ |$$  _$$  _$$\ $$  __$$\ $$  _____|
"  \$$\$$  / $$ |$$ / $$ / $$ |$$ |  \__|$$ /
"   \$$$  /  $$ |$$ | $$ | $$ |$$ |      $$ |
" $$\\$  /   $$ |$$ | $$ | $$ |$$ |      \$$$$$$$\
" \__|\_/    \__|\__| \__| \__|\__|       \_______|

" :so % : To make changes effective

" -----------------------------------------------------------------------------
" COLORS AND SYNTAX HIGHLIGHT
" -----------------------------------------------------------------------------
" Enable syntax highlighting
filetype plugin on
syntax on

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set Mouse
set mouse=a

" -----------------------------------------------------------------------------
" TAB
" -----------------------------------------------------------------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set smartindent

" -----------------------------------------------------------------------------
" LINE NUMBERS
" -----------------------------------------------------------------------------
set number              " show line numbers
set relativenumber	    " show relative line numbers

" -----------------------------------------------------------------------------
" VISUALS
" -----------------------------------------------------------------------------
" set fillchars+=vert:\   " removes pipes on split separators
set fillchars+=vert:\│   " use │ on split separators
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

" Extra column for linting
set signcolumn=yes

" keeps any buffer in the background (keeps everything open)
set hidden

" Visual Wrapping
set wrap
" autocmd FileType python set breakindentopt=shift:4

" Enable indentationn
filetype indent on      " load filetype-specific indent files

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
" MAPPINGS
" -----------------------------------------------------------------------------
" rule:
" mode lhs rhs
" nnoremap means n : normal mode nore : no recursive execution map
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

map <leader>tt :vnew term://bash<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Make adjusting split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vert res-3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :res -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" highlight last inserted text
nnoremap gV `[v`]

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Replace all is aliased to S
nnoremap S :%s//g<left><left>

" Tab switch buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" buffer search shortcut
nnoremap gb :ls<cr>:b<space>

" quit current open buffer and switch to previous buffer
nmap <leader>bq :bp <BAR> bd #<cr>

" SPELL TOGGLE
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

" -----------------------------------------------------------------------------
" => PLUG
" -----------------------------------------------------------------------------
call plug#begin()

    " Rip Grep (:Rg <string> <folder>)
    Plug 'jremmen/vim-ripgrep'

    " See and clean trailing whitespaces (:FixWhitespace)
    Plug 'bronson/vim-trailing-whitespace'

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

    "{{ Autopairs
    "" ---> closing XML tags <---
    Plug 'alvan/vim-closetag'
    "  " ---> closing braces and brackets <---
     Plug 'jiangmiao/auto-pairs'
    "  "}}

    " --- Surrounding (e.g: surround 1 word with '()': ysw), surround 2 lines with '{}' ys2j} )
    "  ysw( : surround 1 word with '(   )' with heading and trailing spaces
    "  cs"' - Change "hello" to 'hello'
    "https://vimawesome.com/plugin/surround-vim
    Plug 'tpope/vim-surround' " ys

    " --- Commentary Toggle (gcc : comment line, gc : comment selection)
    Plug 'tpope/vim-commentary'

    " --- TagBar (ctags)
    Plug 'preservim/tagbar'

    " CoC - Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " --- Ranger File Manager
    Plug 'https://github.com/francoiscabrol/ranger.vim'
    " --- Ranger dependency
    Plug 'rbgrouleff/bclose.vim'

    " --- Undotree (emacs)
    Plug 'mbbill/undotree'

    "{{ TMux - Vim integration
    Plug 'christoomey/vim-tmux-navigator'
    ""}}"}}

    " Nerd Fonts
    Plug 'ryanoasis/vim-devicons'

    "{{ Git integration
    "" ---> git commands within vim <---
    Plug 'tpope/vim-fugitive'
    " ---> git changes on the gutter <---
     Plug 'airblade/vim-gitgutter'
    "  " ---> nerdtree git changes <---
     Plug 'Xuyuanp/nerdtree-git-plugin'
    "  "}}

    " Debug
    Plug 'puremourning/vimspector'

    " Themes
    Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox'

    " Go support for vim
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

call plug#end()

" -----------------------------------------------------------------------------
" => FZF
" -----------------------------------------------------------------------------
let g:fzf_command_prefix = 'Fzf'

" -----------------------------------------------------------------------------
" => NERDTree
" -----------------------------------------------------------------------------
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" ---> show hidden files <---
let NERDTreeShowHidden=1


" -----------------------------------------------------------------------------
" => FZF
" -----------------------------------------------------------------------------
" ---> files on which to activate tags auto-closing <---
 let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'

" -----------------------------------------------------------------------------
" => VIMSPECTOR
" -----------------------------------------------------------------------------
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" -----------------------------------------------------------------------------
" => MAPPINGS PLUGINS
" -----------------------------------------------------------------------------
map <F3> :NERDTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
nnoremap <leader>r :RangerCurrentDirectory<CR>
nnoremap <leader>g :FzfGFiles<CR>
"FZF Ag (file_name and/or file_content) recursively on CWD
nnoremap <leader>ag :FzfAg<CR>
"FZF Rip (file_name and/or file_content) Grep recursively on CWD
nnoremap <leader>rg :FzfRg<CR>
" FZF by file name without file preview on CWD
nnoremap <leader>fz :FZF<CR>
" FZF by file name with file preview on CWD
nnoremap <leader>ff :FzfFiles<CR>
nnoremap <C-p> :FzfFiles<CR>
" Fuzzy find string in current open file
nnoremap <leader>fb :FzfBLines<CR>
nnoremap g/ :FzfBLines<CR>
" Fuzzy find string in files in buffer
nnoremap <leader>fl :FzfLines<CR>
nnoremap g? :FzfLines<CR>
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <leader>h :FzfHistory:<CR>
nnoremap <leader>s :Startify<CR>

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

nnoremap <F8> :TagbarToggle<CR>

" TODO: Learn to code only with ctags before jumping into lsp (CoC)
" https://vimways.org/2018/you-should-be-using-tags-in-vim/
" https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html
" https://gist.github.com/miguelgrinberg/527bb5a400791f89b3c4da4bd61222e4

" Coc Extensions: https://www.npmjs.com/search?q=keywords%3Acoc.nvim
source $HOME/.vim/coc.vim

" Give more space for displaying messages.
set cmdheight=2
colorscheme gruvbox
