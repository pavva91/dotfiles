-- KEY-BINDING VANILLA ---------------------------------------------------------

-- [[ Basic Keymaps ]]

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("n", "<leader>ww", ":w<CR>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- 2 or 4 spaces tab
vim.keymap.set(
	"n",
	"<leader>2",
	"<cmd>set autoindent expandtab tabstop=2 shiftwidth=2<CR>",
	{ desc = "Change indentation to 2 spaces" }
)

vim.keymap.set(
	"n",
	"<leader>4",
	"<cmd>set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent<CR>",
	{ desc = "Change indentation to 4 spaces" }
)

-- vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>',
--   { desc = 'Save Current Open Buffer' })

-- change visual highlight color for code sharing (white-black)
vim.keymap.set({ "n", "v" }, "<leader>cs", "<cmd>highlight Visual guibg=#fdf7ea guifg=black<CR>",
	{ desc = "[C]ode [S]haring - Readable Visual Selection Highlighting" })

-- change visual highlight color for code sharing (purple)
vim.keymap.set({ "n", "v" }, "<leader>cp", "<cmd>highlight Visual guibg=#3344aa guifg=#<CR>",
	{ desc = "[C]ode [P]urple - Purple Visual Selection Highlighting" })

-- change visual highlight color for code sharing
vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>highlight Visual guibg=#283457 guifg=#<CR>",
	{ desc = "[C]ode [C]oding - Default Visual Selection Highlighting" })

-- highlight last inserted text
vim.keymap.set("n", "gV", "`[v`]", { desc = "Highlight Last Inserted Text" })

-- Switch CWD to the directory of the open buffer
vim.keymap.set(
	"n",
	"<leader>cd",
	"<cmd>cd %:p:h<CR><cmd>pwd<cr>",
	{ desc = "Switch CWD to the Directory of the Open Buffer" }
)

-- turn off search highlight
vim.keymap.set("n", "<leader>,", "<cmd>nohlsearch<CR>", { desc = "Turn off Search Highlight" })

-- Replace all is aliased to S
vim.keymap.set("n", "S", ":%s//gc<left><left><left>", { desc = "Save Current Open Buffer" })

-- SPELL TOGGLE
-- Pressing ,ss will toggle and untoggle spell checking
vim.keymap.set("n", "<leader>ss", "<cmd>setlocal spell!<cr>", { desc = "Toggle Spell Checking" })

-- Copy to clipboard
vim.keymap.set({ "n", "x" }, "cp", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n" }, "<leader>Y", 'gg"+yG', { desc = "Copy all buffer to clipboard" })

-- Paste from clipboard
vim.keymap.set({ "n", "x" }, "cv", '"+p', { desc = "Paste from clipboard" })

-- vim.keymap.set({ "v" }, "<leader>p", '"_dP', { desc = "Paste without swapping default register" })
vim.keymap.set({ "v" }, "<leader>p", 'd"0P', { desc = "Paste selection by using yank register" })
vim.keymap.set({ "n" }, "<leader>p", '"0p', { desc = "Paste by using yank register" })

-- Reload our configuration
vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to Next [D]iagnostic" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to Previous [D]iagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float, { desc = "Open Diagnostic floating window" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open List of Diagnostics" })

-- buffer search shortcut
vim.keymap.set("n", "<leader>B", "<cmd>ls<cr>:b<space>", { desc = "Search on List [B]Buffer" })

-- buffer search shortcut and open in vertical split
vim.keymap.set(
	"n",
	"<leader>b",
	"<cmd>ls<cr>:vert sb<space>",
	{ desc = "Search on List [b]Buffer and open on Vertical Split" }
)

-- NOTE: VimScript mappings
-- from this: https://gist.github.com/joelpalmer/9db3f1cdfd463daa6d7c614ae1618fa6
-- Move Selection (with autoindent)

vim.cmd([[
" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" open file in directory of current file
nmap <leader>e :e %:h/
nmap <leader>v :vs %:h/

" Move selection up
vnoremap J :m '>+1<CR>gv=gv
" Move selection down
vnoremap K :m '<-2<CR>gv=gv

]])

-- Format
-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]SP [F]ormat open buffer" })
vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format, { desc = "LSP [F]ormat open [B]uffer" })

-- Git Merge Resolve conflicts (gitdiff)
vim.keymap.set(
	"n",
	"<leader>gj",
	"<cmd>diffget //2<CR>",
	{ desc = "[G]it Diffget from Right (target branch, usually master)" }
)
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //3<CR>", { desc = "[G]it Diffget from Left (merge branch)" })


-- Resize window with shift + and shift -
vim.keymap.set('n', '_', '<c-w>5<')
vim.keymap.set('n', '+', '<c-w>5>')

vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<C-Up>', ':horizontal resize +3<CR>')
vim.keymap.set('n', '<C-Down>', ':horizontal resize -3<CR>')

-- NOTE: <Tab> is equal to <C-i>
-- vim.keymap.set('n', '<Tab>', ':tabnext <CR>')
-- vim.keymap.set('n', '<S-Tab>', ':tabprevious <CR>')

vim.keymap.set('n', '<leader>tn', ':tabnext <CR>', { desc = 'Go to [N]ext [T]ab' })
vim.keymap.set('n', '<leader>tp', ':tabprevious <CR>', { desc = 'Go to [P]revious [T]ab' })

vim.keymap.set('n', 'tn', ':tabnext <CR>', { desc = 'Go to [N]ext [T]ab' })
vim.keymap.set('n', 'tb', ':tabprevious <CR>', { desc = 'Go to [P]revious [T]ab' })

-- scrolling remaps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- TODO: create snippets shorcuts
-- <leader>i -> if
-- <leader>c -> case
-- <leader>f -> function
--

-- sort selection
vim.keymap.set('v', '<leader>s', ':sort<CR>')

-- set wrap
vim.keymap.set('n', '<leader>sw', ':set wrap<CR>')

-- set nowrap
vim.keymap.set('n', '<leader>sn', ':set nowrap<CR>')

-- TODO: create template file
-- vim.cmd(':autocmd BufNewFile *.sh 0r ~/.config/nvim/skeleton.sh')
-- vim.cmd(':autocmd BufNewFile *.md 0r ~/.config/nvim/skeleton.md')

vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR>', { desc = 'Make file executable' })
vim.keymap.set('n', '<C-f>', ':silent !tmux neww ~/dotfiles/productivity/tmux-sessionizer.sh<CR>',
	{ desc = 'Tmux Sessionizer' })

-- NOTE: open NetRW in directory of current open buffer
-- vim.keymap.set('n', '<leader>fp', ':Ex %:h<CR>', { desc = 'Open [F]ile in [P]roject directory NetRW' })
vim.keymap.set('n', '<leader>pf', ':Ex %:h<CR>', { desc = 'Open [P]roject [F]ile directory NetRW' })

-- NOTE: install jq and yq first
vim.keymap.set('n', '<leader>jqj', ':%!jq<CR>', { desc = 'JQ Prettify JSON' })
vim.keymap.set('n', '<leader>jcj', ':%!jq -c<CR>', { desc = 'JQ Compact (De-Prettify) JSON' })
vim.keymap.set('n', '<leader>jqy', ':%!yq -Y<CR>', { desc = 'JQ Prettify Yaml' })
vim.keymap.set('n', '<leader>jcy', ':%!yq -c<CR>', { desc = 'JQ Compact (De-Prettify) Yaml' })
vim.keymap.set('n', '<leader>jqx', ':%!xq -x<CR>', { desc = 'JQ Prettify XML' })
vim.keymap.set('n', '<leader>jcx', ':%!xq -c<CR>', { desc = 'JQ Compact (De-Prettify) XML' })

vim.keymap.set("n", "]c", ":cnext<CR>")
vim.keymap.set("n", "[c", ":cprevious<CR>")

vim.keymap.set("n", "]t", ":tabnext<CR>")
vim.keymap.set("n", "[t", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>yp", 'O<c-r>%<ESC>viW"+ydd', { desc = "[Y]ank file[P]ath of current buffer"})
