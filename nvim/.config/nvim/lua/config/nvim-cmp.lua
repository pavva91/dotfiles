-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.setup({})

cmp.setup({
  -- Enable luasnip to handle snippet expansion for nvim-cmp
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "buffer",    keyword_length = 5 },
    { name = "path" },
    { name = "nvim_lua" },
    -- { name = "cmp_tabnine",          keyword_length = 5 },
    -- { name = "vim-dadbod-completion" },
    -- { name = "cmdline" },
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "menu", "abbr", "kind" },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "[LSP]",
        luasnip = "[SNIP]",
        treesitter = "[TS]",
        buffer = "[BUF]",
        path = "[PATH]",
        nvim_lua = "[LUA]",
        -- cmp_tabnine = "[T9]",
        -- cmdline = "[CMD]",
        -- treesitter = "",
        -- ["vim-dadbod-completion"] = " ",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

-- NOTE: load custom snippets
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
  loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

-- NOTE: Database completion OLD (works)
-- NOTE: example config https://github.com/kristijanhusak/neovim-config/blob/20cd27b0386acf5106c9faab51bdc6f8b2b3cc10/nvim/lua/partials/completion.lua#L18

-- vim.api.nvim_exec2(
--   [[
-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
--  ]],
--   {}
-- )

-- NOTE: Move this autocommand into ../../after/plugin/settings.lua
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = 'sql',
--   callback = function ()
--     cmp.setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
--   end
-- })

-- NOTE: Original with deprecated function
-- vim.api.nvim_exec([[
-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
--   ]], false)
