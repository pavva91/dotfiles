inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

nnoremap <C-s> :w<CR>
nnoremap <C-Q> :wq!<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Replace all is aliased to S
nnoremap S :%s//g<left><left>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SHORTCUTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :sp<CR>:terminal<CR>
nnoremap <F8> :TagbarToggle<CR>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
nnoremap <leader>r :RangerCurrentDirectory<CR>
nnoremap <leader>g :FzfGFiles<CR>
" Ag on CWD
nnoremap <leader>ag :FzfAg<CR>
" Rip Grep on CWD
nnoremap <leader>rg :FzfRg<CR>
" FZF by file name without file preview on CWD
nnoremap <leader>fz :FZF<CR>
" FZF by file name with file preview on CWD
nnoremap <leader>ff :FzfFiles<CR>
nnoremap <C-p> :FzfFiles<CR>
" Fuzzy find string in current open file
nnoremap <leader>fb :FzfBLines<CR>
nnoremap g/ :BLines<CR>
" Fuzzy find string in files in buffer
nnoremap <leader>fl :FzfLines<CR>
nnoremap g? :FzfLines<CR>
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <leader>h :FzfHistory:<CR>
nnoremap <leader>s :Startify<CR>

" nnoremap <C-g> :Ag<CR>

" Ag : Search in directory of the current open file files that contains the searched text
" Rg : Search in directory files that contains the searched text
" BLines : Search in current file
" Lines : Search in all the buffers

" nmap <leader>fi :Files<CR>


" --- tests https://zignar.net/2019/11/21/setup-neovim-for-java-development/
nmap t<C-n> :TestNearest<CR>
nmap t<C-f> :TestFile<CR>
nmap t<C-s> :TestSuite --verbose<CR>
nmap t<C-l> :TestLast<CR>
nmap t<C-g> :TestVisit<CR>

" Paste and replace selection
xnoremap("<leader>p", "\"_dP")

" buffer search shortcut
nnoremap gb :ls<cr>:b<space>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Replace all is aliased to S
nnoremap S :%s//g<left><left>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SIGNIFY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump through hunks
map <leader>gj <plug>(signify-next-hunk)
map <leader>gk <plug>(signify-prev-hunk)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" WHICH KEY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Space> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader> :WhichKey ','<CR>
