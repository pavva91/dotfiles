-- VANILLA SETTINGS -----------------------------------------------------------------

-- Theme
vim.cmd.colorscheme 'onedark'

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make relative line numbers default
vim.opt.relativenumber = true

vim.opt.pastetoggle = "<F2>"
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show the 80th Column
vim.api.nvim_set_option("colorcolumn", "+1")
vim.opt.colorcolumn = "80"

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
