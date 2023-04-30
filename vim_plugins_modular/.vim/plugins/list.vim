" -----------------------------------------------------------------------------
" => PLUG
" -----------------------------------------------------------------------------
call plug#begin()

    " Abbreviation
    " Substitution on steroids (:%Subvert/facilit{y,ies}/building{,s}/g)
    " :Subvert/blog{,s}/post{,s}/g  (you can do that also with normal :s)
    " You can abbreviate it as :S, and it accepts the full range of flags including things like c (confirm).
    " Coercion (crs : coerce to snake case : Turn 'fooBar' into 'foo_bar')
    " MixedCase (crm); camelCase (crc), snake_case (crs), UPPER_CASE (cru),
    " dash-case (cr-), dot.case (cr.), space case (cr<space>), Title Case (crt)
    Plug 'tpope/vim-abolish'

    " * and # Search for the current selection in Visual mode
    Plug 'nelstrom/vim-visual-star-search'

    " Rip Grep (:Rg <string> <folder>)
    Plug 'jremmen/vim-ripgrep'

    " See and clean trailing whitespaces (:FixWhitespace)
    Plug 'bronson/vim-trailing-whitespace'

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " Nerd Tree
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    "  " ---> nerdtree git changes <---
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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
    "  csttp<CR> - Change <h1> tag to <p> tag:
    "https://vimawesome.com/plugin/surround-vim
    Plug 'tpope/vim-surround' " ys

    " Shortcuts with [b ]b for buffer, a for argument, q quickfix, l location,
    " t tags, [e exchange current line with line above ]e exchange with line
    " below
    " ]f to to the next file in the folder, [f go to the previous file in the
    " folder
    Plug 'tpope/vim-unimpaired'

    " --- Commentary Toggle (gcc : comment line, gc : comment selection)
    Plug 'tpope/vim-commentary'

    " --- Enable . to repeat also plugin commands
    Plug 'tpope/vim-repeat'

    " --- TagBar (ctags)
    Plug 'preservim/tagbar'

    " CoC - Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neoclide/coc.nvim', {'tag': 'v0.0.78'}

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
    "  "}}

    " Run Tests
    Plug 'vim-test/vim-test'

    " Debug
    Plug 'puremourning/vimspector'

    " Themes
    Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox'
    Plug 'sheerun/vim-wombat-scheme'
    " Plug 'chriskempson/base16-vim'
    " Plug 'altercation/solarized'

    " Show colors on screen (fix: :set syntax=sh, )
    " to fix it and activate it, run:
    " :set syntax=css
    " :set syntax=bash
    Plug 'ap/vim-css-color', { 'for': ['css', 'vim']  }

    " Go support for vim
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

    " Dart support for vim
    Plug 'dart-lang/dart-vim-plugin'

    " On-demand lazy load
    " Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

    " To register the descriptions when using the on-demand load feature,
    " use the autocmd hook to call which_key#register(), e.g., register for the Space key:
    " autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
call plug#end()
