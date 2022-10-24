call plug#begin('~/.vim/plugged')

" Rip Grep (:Rg <string> <folder>)
Plug 'jremmen/vim-ripgrep'

" See and clean trailing whitespaces (:FixWhitespace)
Plug 'bronson/vim-trailing-whitespace'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" --- Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" --- Start Page
Plug 'mhinz/vim-startify'

"{{ Autopairs
"" ---> closing XML tags <---
Plug 'alvan/vim-closetag'
"  " ---> closing braces and brackets <---
 Plug 'jiangmiao/auto-pairs'
"  "}}

" --- Surrounding (e.g: surround 1 word with '()': ysw), surround 2 lines with '{}' ys2j} )
"  cs"' - Change "hello" to 'hello'
Plug 'tpope/vim-surround' " ys

" --- Commentary Toggle (gcc : comment line, gc : comment selection)
Plug 'tpope/vim-commentary'

" --- TagBar (ctags)
Plug 'preservim/tagbar'

" --- CoC (Intellisense)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" --- Ranger File Manager
Plug 'https://github.com/francoiscabrol/ranger.vim'
" --- Ranger dependency
Plug 'rbgrouleff/bclose.vim'

" --- Undotree (emacs)
Plug 'mbbill/undotree'

"{{ TMux - Vim integration
Plug 'christoomey/vim-tmux-navigator'
""}}"}}

" Nerd Fonts
Plug 'ryanoasis/vim-devicons'
call plug#end()

" --- Git Integration https://www.youtube.com/watch?v=F7JZdAwGmpU
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
"{{ Git integration
"" ---> git commands within vim <---
Plug 'tpope/vim-fugitive'
" ---> git changes on the gutter <---
 Plug 'airblade/vim-gitgutter'
"  " ---> nerdtree git changes <---
 Plug 'Xuyuanp/nerdtree-git-plugin'
"  "}}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'liuchengxu/vim-which-key'

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

" --- Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" --- Test
Plug 'vim-test/vim-test'

" --- Themes
Plug 'https://github.com/Matsuuu/pinkmare'
Plug 'https://github.com/morhetz/gruvbox'

" Colorscheme
Plug 'joshdick/onedark.vim'

" --- Status Bar
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

  call plug#end()
