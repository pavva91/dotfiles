"   _____       _ __        _
"  /_  _/___   (_) /__   __(_)___ ___
"   / / / __ \/ / __/ | / / / __  __ \
" _/ /_/ / / / / /__| |/ / / / / / / /
"/____/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

source $HOME/.config/nvim/native-config/netrw.vim

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/ranger.vim
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/nvim-colorizer.vim
source $HOME/.config/nvim/plug-config/treesitter.vim

source $HOME/.config/nvim/keys/mappings.vim

" --- Theme
colorscheme gruvbox

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" --- CloseTag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml' " On which file closeTag is active

" --- ctags mapping Tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" Try remapping to insert code snippets
" -1 means 'go up one line (k)' <CR> means hit 'Enter'
nnoremap ,html :-1read ~/.config/nvim/my_snippets/hello_snippet.html<CR>3jwf>a
