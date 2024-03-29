-- NOTE: not using this file
-- NOTE: Took from DevOps Toolbox: https://yewtu.be/watch?v=NhTPVXP8n7w

local M = {}

local function db_completion()
  require("cmp").setup.buffer({
    sources = {
      { name = "vim-dadbod-completion" },
    },
    formatting = {
      fields = { "menu", "abbr", "kind" },
      format = function(entry, item)
        -- fancy icons and a name of kind
        -- item.kind = require("lspkind").presets.default[item.kind] .. " " .. item.kind

        -- item.menu = ({
        --   ["vim-dadbod-completion"] = "[DB]",
        -- })[entry.source.name]

        local menu_icon = {
          ["vim-dadbod-completion"] = "[DB]",
        }
        item.menu = menu_icon[entry.source.name]

        return item
      end,
    },
  })
end

function M.setup()
  vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "sql",
    },
    command = [[setlocal omnifunction=vim_dadbod_completion#omni]],
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "sql",
      "mysql",
      "plsql",
    },
    callback = function()
      vim.schedule(db_completion)
    end,
  })
end

return M
