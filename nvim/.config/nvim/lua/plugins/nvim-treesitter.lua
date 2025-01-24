return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    -- event = "VeryLazy",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ':TSUpdate',
    config = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        require("nvim-treesitter.configs").setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "go",
                "lua",
                "python",
                "rust",
                "javascript",
                "tsx",
                "typescript",
                "vue",
                "css",
                "html",
                "json",
                "vim",
                "vimdoc",
                "yaml",
                "regex",
                "markdown",
                "markdown_inline",
                "sql",
            },
            autotag = {
                enable = true,
                filetypes = {
                    "html",
                    "javascript",
                    "typescript",
                    "vue",
                    "xml",
                },
            },
            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true, disable = { "python" } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    -- init_selection = "<c-space>", -- c=ctrl
                    -- node_incremental = "<c-space>",
                    -- scope_incremental = "<c-s>",
                    -- node_decremental = "<M-space>", -- M=meta=alt
                    init_selection = "<C-n>", -- c=ctrl
                    node_incremental = "<C-n>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<C-p>", -- M=meta=alt
                },
            },
            matchup = {
                enable = true,
            }
        })
    end,
}
