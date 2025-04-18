-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/keys.lua
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
})

local telescopebuiltin = require("telescope.builtin")

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
    mode = "n",  -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
    mode = "v",  -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
    f = {
        s = {
            '"zy<ESC>:lua require("telescope.builtin").live_grep({ default_text="<c-r>z", prompt_title="Find visual selection" })<CR>',
            "[F]ind current selection (uses z register)",
        },
    }
}

which_key.register(vmappings, vopts)

local mappings = {
    f = {
        name = " Telescope (Finder)",
        a = {
            function()
                telescopebuiltin.find_files({
                    hidden = true,
                    prompt_title = "Find Files (hidden)",
                })
            end,
            "[F]ind [A]ll Files",
        },
        f = {
            -- NOTE: this is overwritten by ~/.local/share/nvim/lazy/telescope.nvim/lua/tlescope/builtin/init.lua
            -- NOTE: this is useless
            telescopebuiltin.find_files,
            "[F]ind [F]iles OVERWRITTEN",
        },
        F = {
            -- '<cmd>lua require "telescope.builtin".live_grep { default_text = vim.fn.expand("function ")}<CR>',
            function()
                telescopebuiltin.live_grep({
                    default_text = "function ",
                    prompt_title = "Find 'function' with grep",
                })
            end,
            "[F]ind [F]unction with grep",
        },
        p = {
            -- NOTE: old way (works)
            -- '<cmd>lua require "telescope.builtin".live_grep { default_text = vim.fn.expand("def ")}<CR>',
            function()
                telescopebuiltin.live_grep({
                    default_text = "def ",
                    prompt_title = "Find python function 'def' with grep",
                })
            end,
            "[F]ind [P]ython function with grep",
        },
        h = {
            telescopebuiltin.help_tags,
            "[F]ind [H]elp",
        },
        w = {
            telescopebuiltin.grep_string,
            "[F]ind current [W]ord",
        },
        W = {
            function()
                local word = vim.fn.expand("<cWORD>")
                telescopebuiltin.grep_string({ search = word })
            end,
            "[F]ind current Big [W]ord"
        },
        g = {
            telescopebuiltin.live_grep,
            "[F]ind by [G]rep",
        },
        D = {
            telescopebuiltin.diagnostics,
            "[F]ind [D]iagnostics of the whole project",
        },
        j = {
            telescopebuiltin.jumplist,
            "[F]ind [J]ump list",
        },
        m = {
            telescopebuiltin.marks,
            "[F]ind [M]arks",
        },
        r = {
            telescopebuiltin.resume,
            "[F]ind [R]esume",
        },
        B = {
            telescopebuiltin.current_buffer_fuzzy_find,
            "[F]uzzy find in current [B]uffer",
        },
        k = {
            telescopebuiltin.keymaps,
            "[F]ind [K]eymaps",
        },
        s = {
            telescopebuiltin.git_status,
            "[F]ind Git [S]tatus and Diff",
        },
        c = {
            telescopebuiltin.command_history,
            "[F]ind Command History",
        },
        C = {
            telescopebuiltin.git_commits,
            "[F]ind Git [C]ommits",
        },
        G = {
            telescopebuiltin.git_files,
            "[F]ind [G]it Files (hidden files)",
        },
    },
}

which_key.register(mappings, opts)

-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "gr", telescopebuiltin.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "<leader><space>", telescopebuiltin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", telescopebuiltin.current_buffer_fuzzy_find,
    { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader>ds", telescopebuiltin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>ws", telescopebuiltin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

local telescope = require("telescope")
vim.keymap.set("n", "<leader>rg", require('telescope').extensions.live_grep_args.live_grep_args,
    { desc = "[R]ip [G]rep" })
vim.keymap.set("n", "<leader>pws", function()
    local word = vim.fn.expand("<cword>")
    telescopebuiltin.grep_string({ search = word })
end)
vim.keymap.set("n", "<leader>pd", function()
        local word = vim.fn.expand("<cword>")
        telescopebuiltin.grep_string({
            search = "def " .. word,
            prompt_title = "Find python function 'def'",
        })
    end,
    { desc = "Find [P]ython [D]efinition function current word" }
)
vim.keymap.set("n", "<leader>jd", function()
        local word = vim.fn.expand("<cword>")
        telescopebuiltin.grep_string({
            search = "function " .. word,
            prompt_title = "Find js function 'function'",
        })
    end,
    { desc = "Find [J]avaScript [D]efinition function current word" }
)
-- vim.keymap.set("n", "<leader>pWs", function()
-- 	local word = vim.fn.expand("<cWORD>")
-- 	telescopebuiltin.grep_string({ search = word })
-- end,
-- 	{ desc = "Find big word under the cursor" }
-- )
vim.keymap.set("n", "<leader>ps", function()
    telescopebuiltin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- vim.keymap.set("n","<leader>rg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",{ desc = "[R]ip [G]rep" })
-- require('plugins.telescope').extensions.live_grep_args.live_grep_args

-- vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
-- vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
-- vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
-- vim.keymap.set("n", "<leader>fG", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
-- vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind [D]iagnostics" })
-- vim.keymap.set("n", "<leader>fj", require("telescope.builtin").jumplist, { desc = "[F]ind [J]ump list" })
-- vim.keymap.set("n", "<leader>fm", require("telescope.builtin").marks, { desc = "[F]ind [M]arks" })

-- resume from last search
-- vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "[F]ind [R]esume" })
-- vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind [B]uffers" })
-- vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "[F]ind [K]eymaps" })

-- Git
-- vim.keymap.set("n", "<leader>fs", require("telescope.builtin").git_status, { desc = "[F]ind Git [S]tatus and Diff" })
-- vim.keymap.set("n", "<leader>fc", require("telescope.builtin").git_commits, { desc = "[F]ind Git [C]ommits" })
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>fg",
-- 	require("telescope.builtin").git_files,
-- 	{ desc = "[F]ind [G]it Files (hidden files)" }
-- )
