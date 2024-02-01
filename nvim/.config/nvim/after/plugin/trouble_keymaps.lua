-- Lua

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",    -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  x = {
    name = "Trouble",
    x = {
      "<cmd>TroubleToggle<cr>",
      "Trouble Toggle",
    },
    w = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "Workspace diagnostics",
    },
    d = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      "Document Diagnostics",
    },
    l = {
      "<cmd>TroubleToggle loclist<cr>",
      "Loc List",
    },
    q = {
      "<cmd>TroubleToggle quickfix<cr>",
      "Trouble Quickfix",
    },
  },
}

which_key.register(mappings, opts)

vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
