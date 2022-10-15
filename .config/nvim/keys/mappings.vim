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

" --- Shortcuts
nnoremap <F2> :sp<CR>:terminal<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :bd<CR>

nmap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>r :Ranger<CR>
nnoremap <C-p> :Files<CR>
nmap <leader>gf :GFiles<CR>
nnoremap <C-g> :Ag<CR>
nmap <leader>rg :Rg<CR>
nnoremap <F8> :TagbarToggle<CR>
" nmap <leader>fi :Files<CR>

" --- tests https://zignar.net/2019/11/21/setup-neovim-for-java-development/
nmap t<C-n> :TestNearest<CR>
nmap t<C-f> :TestFile<CR>
nmap t<C-s> :TestSuite --verbose<CR>
nmap t<C-l> :TestLast<CR>
nmap t<C-g> :TestVisit<CR>

" Paste and replace selection
xnoremap("<leader>p", "\"_dP")
