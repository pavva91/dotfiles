" -----------------------------------------------------------------------------
" MAPPINGS VIM Vanilla
" -----------------------------------------------------------------------------
" rule:
" mode lhs rhs
" nnoremap means n : normal mode nore : no recursive execution map
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" 2 or 4 spaces tab
map <leader>2 :set autoindent expandtab tabstop=2 shiftwidth=2<CR>
map <leader>4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent<CR>

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
nnoremap S :%s//gc<left><left><left>

" Tab switch buffer
" nnoremap <TAB> :bnext<CR>
" nnoremap <S-TAB> :bprevious<CR>

" buffer search shortcut
nnoremap gb :ls<cr>:b<space>

" buffer search shortcut and open in vertical split
nnoremap gB :ls<cr>:vert sb<space>

" quit current open buffer and switch to previous buffer
nmap <leader>bq :bp <BAR> bd #<cr>

" SPELL TOGGLE
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts spell using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Shortcuts buffer traversing
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Edit Shortcuts (Open file full window, horizontal split, vertical split, new
" tab)
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Fixing the & Command
nnoremap & :&&<CR>
xnoremap & :&&<CR>
