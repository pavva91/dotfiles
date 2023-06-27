local dap = require("dap")

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
  d = {
    name = "DAP - Debug",
    x = {
      dap.terminate,
      "DAP Terminate Debug Session",
    },
    d = {
      dap.disconnect,
      "DAP [D]isconnect",
    },
    l = {
      dap.run_last,
      "DAP Run [L]ast",
    },
    j = {
      dap.repl.open,
      "DAP Open [D]ebug [R]EPL",
    },
  },
}

which_key.register(mappings, opts)

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
vim.keymap.set("n", "<F10>", dap.step_into, { desc = "DAP Step Into" })
vim.keymap.set("n", "<F11>", dap.step_over, { desc = "DAP Step Over" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
vim.keymap.set("n", "<leader><F5>", dap.terminate, { desc = "DAP Terminate Debug Session" })
-- vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "DAP Terminate Debug Session" })
-- vim.keymap.set("n", "<leader>dd", dap.disconnect, { desc = "DAP [D]isconnect" })
-- vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP Run [L]ast" })
-- vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP Open [D]ebug [R]EPL" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Toggle Breakpoint condition" })
vim.keymap.set("n", "<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP: Toggle Breakpoint condition with log point message" })
