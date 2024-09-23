-- SETTINGS PLUGINS -----------------------------------------------------------------

-- Set Colorscheme folke/tokyonight.nvim
vim.cmd.colorscheme 'tokyonight-night'

-- Set Colorscheme navarasu/onedark.nvim
-- vim.cmd.colorscheme 'onedark'

-- Set Colorscheme marko-cerovac/material.nvim
-- vim.cmd.colorscheme 'material'

-- Material Style
vim.g.material_style = "deep ocean"

-- to change run this Ex command: :lua require("material.functions").find_style()
--
---------------------------------------------------------------------------
-- => FZF https://github.com/junegunn/fzf.vim
---------------------------------------------------------------------------
-- let g:fzf_command_prefix = 'Fzf'
-- DOESN'T WORK
vim.g.fzf_command_prefix = 'Fzf'
-- vim.cmd([[
-- let g:fzf_command_prefix = 'Fzf'
-- ]])

---------------------------------------------------------------------------
-- => Treesitter
---------------------------------------------------------------------------
vim.treesitter.language.register("html", "xhtml")
