" -----------------------------------------------------------------------------
" => MAPPINGS PLUGINS
" -----------------------------------------------------------------------------
map <F3> :NERDTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
" nnoremap <leader>r :RangerCurrentDirectory<CR>
nnoremap <leader>g :FzfGFiles<CR>
"FZF Ag (file_name and/or file_content) recursively on CWD ([F]ind [A]g)
nnoremap <leader>fa :FzfAg<CR>
"FZF RipGrep (file_name and/or file_content) Grep recursively on CWD ([F]ind [G]rep)
nnoremap <leader>fg :FzfRg<CR>
" FZF by file name without file preview on CWD
nnoremap <leader>fz :FZF<CR>
" FZF by file name with file preview on CWD
nnoremap <leader>ff :FzfFiles<CR>
" nnoremap <C-p> :FzfFiles<CR>
" [/] Fuzzily search in current buffer
nnoremap <leader>/ :FzfBLines<CR>

" [F]ind [H]elp
nnoremap <leader>fh :FzfHelptags<CR>

" [F]ind [B]uffer
nnoremap <leader>fb :FzfBuffers<CR>
" [F]ind [B]uffer
nnoremap <leader><space> :FzfBuffers<CR>
" Fuzzy find string in all files in buffers
nnoremap <leader>fl :FzfLines<CR>
nnoremap g? :FzfLines<CR>
nnoremap <leader>? :FzfLines<CR>

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
