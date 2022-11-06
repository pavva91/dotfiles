" -----------------------------------------------------------------------------
" => PLUG
" -----------------------------------------------------------------------------
call plug#begin()

    " Rip Grep (:Rg <string> <folder>)
    Plug 'jremmen/vim-ripgrep'

    " See and clean trailing whitespaces (:FixWhitespace)
    Plug 'bronson/vim-trailing-whitespace'

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

    "a Plugin outside ~/.vim/plugged with post-update hook
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
    "  ysw( : surround 1 word with '(   )' with heading and trailing spaces
    "  cs"' - Change "hello" to 'hello'
    "https://vimawesome.com/plugin/surround-vim
    Plug 'tpope/vim-surround' " ys

    " --- Commentary Toggle (gcc : comment line, gc : comment selection)
    Plug 'tpope/vim-commentary'

    " --- TagBar (ctags)
    Plug 'preservim/tagbar'

    " CoC - Intellisense
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

    "{{ Git integration
    "" ---> git commands within vim <---
    Plug 'tpope/vim-fugitive'
    " ---> git changes on the gutter <---
     Plug 'airblade/vim-gitgutter'
    "  " ---> nerdtree git changes <---
     Plug 'Xuyuanp/nerdtree-git-plugin'
    "  "}}

    " Debug
    Plug 'puremourning/vimspector'

    " Themes
    Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox'

    " Go support for vim
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

call plug#end()
