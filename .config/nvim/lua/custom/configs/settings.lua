-- VANILLA SETTINGS -----------------------------------------------------------------
local set = vim.opt

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Theme
vim.cmd.colorscheme 'desert'

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make relative line numbers default
set.relativenumber = true

set.pastetoggle = "<F2>"
set.showcmd = true
set.cursorline = true

-- Default indentation 4 spaces
set.tabstop = 4      -- number of visual spaces per TAB
set.softtabstop = 4  -- number of spaces in tab when editing
set.shiftwidth = 4
set.expandtab = true -- tabs are spaces
set.smartindent = true

-- Set indentation width ot 2 spaces
-- set.autoindent = true
-- set.expandtab = true
-- set.tabstop = 2
-- set.shiftwidth = 2
-- set autoindent expandtab tabstop=2 shiftwidth=2

-- Set termguicolors, needed for nvim-colorizer
set.termguicolors = true

set.splitbelow = true
set.splitright = true

-- Show the 80th Column
vim.api.nvim_set_option("colorcolumn", "+1")
set.colorcolumn = "80"

-- Set highlight on search
set.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
set.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
set.clipboard = ''

-- Enable break indent
set.breakindent = true

-- Save undo history
set.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
set.updatetime = 250
set.timeout = true
set.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- set.completeopt = 'menuone,noselect'
set.completeopt = 'noinsert,menuone,noselect'

-- NOTE: You should make sure your terminal supports this
set.termguicolors = true

-- Disable Swap to allow modification from other text editors (e.g. VScodium, vim)
set.swapfile = false
