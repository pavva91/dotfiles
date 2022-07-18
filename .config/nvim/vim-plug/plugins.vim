call plug#begin('~/.vim/plugged')
  " The default plugin directory will be as follows:
  "   - Vim (Linux/macOS): '~/.vim/plugged'
  "   - Vim (Windows): '~/vimfiles/plugged'
  "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
  " You can specify a custom plugin directory by passing it as the argument
  "   - e.g. `call plug#begin('~/.vim/plugged')`
  "   - Avoid using standard Vim directory names like 'plugin'

  " Make sure you use single quotes

  " On-demand loading
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

  " Plugin outside ~/.vim/plugged with post-update hook
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " --- Change Project Root Directory
  Plug 'airblade/vim-rooter'
  " :FZF
  " :Files
  " :Rg (rip grep)
  " :BLines
  " :Lines
  " :Ag (silver search)
  " :Buffers
  " :History:

  " --- Syntax Highlighting
  Plug 'sheerun/vim-polyglot'

  " --- Themes
  Plug 'https://github.com/Matsuuu/pinkmare'
  Plug 'https://github.com/morhetz/gruvbox'

  " Colorscheme
  Plug 'joshdick/onedark.vim'

  " --- Status Bar
  Plug 'https://github.com/vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " --- Ranger File Manager
  Plug 'https://github.com/francoiscabrol/ranger.vim'
  " --- Ranger dependency
  Plug 'rbgrouleff/bclose.vim'

  " --- Start Page
  Plug 'mhinz/vim-startify'

  " --- Auto close parenthesys
  Plug 'jiangmiao/auto-pairs'

  " --- Surrounding (e.g: surround 1 word with '()': ysw), surround 2 lines with '{}' ys2j} )
  "  cs"' - Change "hello" to 'hello'
  Plug 'tpope/vim-surround' " ys

  " --- Commentary Toggle (gcc : comment line, gc : comment selection)
  Plug 'tpope/vim-commentary'

  " --- CloseTag (html, xml...)
  Plug 'alvan/vim-closetag'

  " --- TagBar (ctags)
  Plug 'preservim/tagbar'

  " --- CoC (Intellisense)
  "  Stable version of coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Keeping up to date with master
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

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

  " --- Icons
  Plug 'ryanoasis/vim-devicons'

  " --- Test
  Plug 'vim-test/vim-test'

  " --- Git Integration https://www.youtube.com/watch?v=F7JZdAwGmpU
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'

  call plug#end()
