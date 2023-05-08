local dap = require 'dap'

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP Continue' })
vim.keymap.set('n', '<F10>', dap.step_into, { desc = 'DAP Step Into' })
vim.keymap.set('n', '<F11>', dap.step_over, { desc = 'DAP Step Over' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'DAP Step Out' })
vim.keymap.set('n', '<leader><F5>', dap.terminate, { desc = 'DAP Terminate Debug Session' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'DAP Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'DAP: Toggle Breakpoint condition' })
vim.keymap.set('n', '<leader>lp', function()
  dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
end, { desc = 'DAP: Toggle Breakpoint condition with log point message' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'DAP Open [D]ebug [R]EPL' })
