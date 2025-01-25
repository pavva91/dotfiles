local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    command = "checktime",
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Remove trailing space on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("delete_trailing_space"),
    pattern = { "*" },
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos(".", save_cursor)
    end,
})

-- javascript treesitter keymaps
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("javascript_treesitter_keymap"),
    pattern = {
        "javascript",
    },
    callback = function()
        local ts_textobjects_move = require("nvim-treesitter.textobjects.move")

        vim.keymap.set("n", "]=",
            function ()
                ts_textobjects_move.goto_next_start({ query = "@varassign.inner", query_group = "locals", desc = "Next variable assignment start" })
            end,
            { desc = "Next variable assignment start"})

        -- vim.keymap.set("n", "]v", ts_textobjects_move.goto_next_start({ query = "@vardef.outer", query_group = "locals", desc = "Next variable definition start" }), { desc = "Next variable definition start"})
        -- vim.keymap.set("n", "]{", ts_textobjects_move.goto_next_start({ query = "@mustache.open", query_group = "locals", desc = "Next mustache open" }), { desc = "Next variable definition start"})
        -- vim.keymap.set("n", "]}", ts_textobjects_move.goto_next_start({ query = "@mustache.close", query_group = "locals", desc = "Next mustache open" }), { desc = "Next variable definition start"})
        --
        -- vim.keymap.set("n", "[=", ts_textobjects_move.goto_previous_start({ query = "@varassign.inner", query_group = "locals", desc = "Previous variable assignment start" }), { desc = "Previous variable assignment start"})
        -- vim.keymap.set("n", "[v", ts_textobjects_move.goto_previous_start({ query = "@vardef.outer", query_group = "locals", desc = "Previous variable definition start" }), { desc = "Previous variable definition start"})
        -- vim.keymap.set("n", "[{", ts_textobjects_move.goto_previous_start({ query = "@mustache.open", query_group = "locals", desc = "Previous mustache open" }), { desc = "Previous variable definition start"})
        -- vim.keymap.set("n", "[}", ts_textobjects_move.goto_previous_start({ query = "@mustache.close", query_group = "locals", desc = "Previous mustache close" }), { desc = "Previous variable definition start"})

        -- ["]v"] = { query = "@vardef.outer", query_group = "locals", desc = "Next variable definition start" },
    end,
})

