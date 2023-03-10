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

" -----------------------------------------------------------------------------
" GIT GUTTER
" -----------------------------------------------------------------------------
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap <leader>gd :GitGutterDiffOrig<CR>
nnoremap <leader>gf :GitGutterFold<CR>
nnoremap <leader>gh :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>sh :GitGutterStageHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>

" -----------------------------------------------------------------------------
" COC MAPPINGS
" -----------------------------------------------------------------------------
" Mappings for CoCList
" Show all diagnostics.
" :CocList diagnostics gives error: Uncaught exception: EISDIR: illegal
" operation on a directory, read
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>a  :<C-u>CocDiagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait><leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

" nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>

" Format All Code
nmap <leader>lf <Plug>(coc-format)

" Show documentation for the word under the cursor
nnoremap <silent> K :call CocAction('doHover')<CR>

" Show diagnostics list
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>

" Show symbols list
nnoremap <silent> <leader>s :<C-u>CocList -I symbols<cr>

nmap <leader>do <Plug>(coc-codeaction)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <CR> to confirm completion, use: >
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Symbol renaming.
nmap <leader>cw <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for applying code actions at the cursor position
nmap <leader>ca  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nmap <silent> <C-S> <Plug>(coc-range-select-backward)
xmap <silent> <C-S> <Plug>(coc-range-select-backward)
