" -----------------------------------------------------------------------------
" => FZF https://github.com/junegunn/fzf.vim
" -----------------------------------------------------------------------------
let g:fzf_command_prefix = 'Fzf'

" -----------------------------------------------------------------------------
" => NERDTree https://github.com/preservim/nerdtree
" -----------------------------------------------------------------------------
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" ---> show hidden files <---
let NERDTreeShowHidden=1

" -----------------------------------------------------------------------------
" => NERDTree Git Plugin https://github.com/Xuyuanp/nerdtree-git-plugin
" -----------------------------------------------------------------------------

let g:NERDTreeGitStatusUseNerdFonts = 1

" let g:NERDTreeGitStatusIndicatorMapCustom = {
"                 \ 'Modified'  :'✹',
"                 \ 'Staged'    :'✚',
"                 \ 'Untracked' :'✭',
"                 \ 'Renamed'   :'➜',
"                 \ 'Unmerged'  :'═',
"                 \ 'Deleted'   :'✖',
"                 \ 'Dirty'     :'✗',
"                 \ 'Ignored'   :'☒',
"                 \ 'Clean'     :'✔︎',
"                 \ 'Unknown'   :'?',
"                 \ }

" -----------------------------------------------------------------------------
" => CloseTag https://github.com/alvan/vim-closetag
" -----------------------------------------------------------------------------
" ---> files on which to activate tags auto-closing <---
 let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'
