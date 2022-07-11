source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

" --- Shortcuts
nnoremap <F3> :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR
" nnoremap <C-r> :Ranger<CR>
nnoremap <C-p> :Files<CR>
nmap <leader>gf :GFiles<CR>
nnoremap <C-g> :Ag<CR>
nmap <leader>rg :Rg<CR>
nnoremap <F8> :TagbarToggle<CR>
" nmap <leader>fi :Files<CR>
" --- tests https://zignar.net/2019/11/21/setup-neovim-for-java-development/
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite --verbose<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" --- Theme
colorscheme gruvbox

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" --- Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" --- CloseTag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml' " On which file closeTag is active

" --- ctags mapping Tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" --- Vim Standard File Manager (netrw)
let g:netrw_banner=0
let g:netrw_liststyle=3

" Try remapping to insert code snippets
" -1 means 'go up one line (k)' <CR> means hit 'Enter'
nnoremap ,html :-1read ~/.config/nvim/my_snippets/hello_snippet.html<CR>3jwf>a

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/modules/vim-which-key.vim
source $HOME/.config/nvim/modules/nvim-colorizer.vim
source $HOME/.config/nvim/modules/treesitter.vim
