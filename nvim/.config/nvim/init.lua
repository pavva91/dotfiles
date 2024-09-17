require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })

  require("lsp_signature").on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded",
    },
    hint_prefix = "󱄑 ",
  }, bufnr)
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  -- html = {},
  jsonls = {},
  emmet_ls = {
    filetypes = {
      "css",
      "html",
      "javascript",
      "xml",
      "vue",
      "xhtml",
    }
  },
  bashls = {},
  volar = {
    filetypes = {
      "vue",
      "html",
    },
  },
  -- tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  jdtls = {},
  gradle_ls = {},
  angularls = {},
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- -- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
  -- if not excl_servers[server_name] then
  if server_name ~= "jdtls" then
    local config = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
    require("lspconfig")[server_name].setup(config)
  end
  -- if server_name == "jdtls" then
  --   vim.notify("jdtls encountered!", vim.log.levels.INFO)
  -- end
end

require("fidget").setup()

-- INFO: Mason END

-- INFO: nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.abort(),
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
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "cmp_tabnine" },
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
        cmp_tabnine = "[TN]",
        -- cmdline = "[CMD]",
        -- treesitter = "",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

-- INFO: Execute Java Language Server with autocommand to attach on every buffer (VimScript)
-- vim.cmd [[
-- augroup jdtls_lsp
--     autocmd!
--     autocmd FileType java lua require'jdtls.jdtls_setup'.setup()
-- augroup end
-- ]]

-- INFO: Use lua instead of vimscript
local jdtls_lsp = vim.api.nvim_create_augroup("JdtlsGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    require('custom.lsp.jdtls.setup').setup()
  end,
  group = jdtls_lsp,
  pattern = "java",
})
