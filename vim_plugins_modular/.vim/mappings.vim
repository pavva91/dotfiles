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

" buffer search shortcut and open in vertical split
nnoremap gB :ls<cr>:vert sb<space>

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

