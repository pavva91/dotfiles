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

" --- Shortcuts
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :sp<CR>:terminal<CR>
nnoremap <F8> :TagbarToggle<CR>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>r :Ranger<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>fz :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History:<CR>

nnoremap <C-p> :Files<CR>
" nnoremap <C-g> :Ag<CR>

" Ag : Search in directory of the current open file files that contains the searched text
" Rg : Search in directory files that contains the searched text
" BLines : Search in current file
" Lines : Search in all the buffers

" nmap <leader>fi :Files<CR>

nnoremap <leader>s :Startify<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" --- tests https://zignar.net/2019/11/21/setup-neovim-for-java-development/
nmap t<C-n> :TestNearest<CR>
nmap t<C-f> :TestFile<CR>
nmap t<C-s> :TestSuite --verbose<CR>
nmap t<C-l> :TestLast<CR>
nmap t<C-g> :TestVisit<CR>

" Paste and replace selection
xnoremap("<leader>p", "\"_dP")
