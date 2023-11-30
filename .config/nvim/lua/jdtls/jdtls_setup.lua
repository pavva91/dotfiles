local M = {}

function M.setup()
  local jdtls = require("jdtls")
  local jdtls_dap = require("jdtls.dap")
  local jdtls_setup = require("jdtls.setup")
  local home = os.getenv("HOME")

  local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
  local root_dir = jdtls_setup.find_root(root_markers)

  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  local workspace_dir = home .. "/.cache/jdtls/workspace" .. project_name

  local path_to_jdtls = home .. "/.local/share/nvim/mason/packages/jdtls"
  local path_to_config = path_to_jdtls .. "/config_linux"
  local path_to_plugins = path_to_jdtls .. "/plugins/"
  local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"
  local lombok_path = path_to_jdtls .. "/lombok.jar"
  local path_to_jdebug = home .. "/.local/share/nvim/mason/packages/java-debug-adapter"
  local path_to_jtest = home .. "/.local/share/nvim/mason/packages/java-test"
  local bundles = {
    vim.fn.glob(path_to_jdebug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
  }

  -- local extendedClientCapabilities = jdtls.extendedClientCapabilities
  -- extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  vim.list_extend(bundles, vim.split(vim.fn.glob(path_to_jtest .. "/extension/server/*.jar", true), "\n"))

  local on_attach = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    jdtls_dap.setup_dap_main_class_configs()
    jdtls_setup.add_commands()
    require("lsp_signature").on_attach({
      bind = true,
      padding = "",
      handler_opts = {
        border = "rounded",
      },
      hint_prefix = "󱄑 ",
    }, bufnr)

    -- Mappings.
    -- local opts = { noremap = true, silent = true }
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
    -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- -- Java specific
    -- buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    -- buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    -- buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    -- buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    -- buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    -- buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
    --
    -- buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  end

  local capabilities = {
    workspace = {
      configuration = true
    },
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  }

  local config = {
    flags = {
      allow_incremental_sync = true,
    },
    -- capabilities = capabilities,
    -- on_attach = on_attach,
  }

  config.cmd = {
    --
    -- 				-- 💀
    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "-javaagent:" .. lombok_path,
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    path_to_jar,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    path_to_config,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
  }

  -- local on_attach = function(client, bufnr)
  --   jdtls.setup_dap({ hotcodereplace = "auto" })
  --   jdtls_dap.setup_dap_main_class_configs()
  --   jdtls_setup.add_commands()
  --   require("lsp_signature").on_attach({
  --     bind = true,
  --     padding = "",
  --     handler_opts = {
  --       border = "rounded",
  --     },
  --     hint_prefix = "󱄑 ",
  --   }, bufnr)
  --   require 'lspkind'.init()
  --   require 'lspsaga'.init_lsp_saga()
  --
  --   -- Kommentary
  --   -- vim.api.nvim_set_keymap("n", "<leader>/", "<plug>kommentary_line_default", {})
  --   -- vim.api.nvim_set_keymap("v", "<leader>/", "<plug>kommentary_visual_default", {})
  --
  --   -- require 'formatter'.setup {
  --   --   filetype = {
  --   --     java = {
  --   --       function()
  --   --         return {
  --   --           exe = 'java',
  --   --           args = { '-jar', os.getenv('HOME') .. '/.local/jars/google-java-format.jar', vim.api.nvim_buf_get_name(0) },
  --   --           stdin = true
  --   --         }
  --   --       end
  --   --     }
  --   --   }
  --   -- }
  --
  --   -- vim.api.nvim_exec([[
  --   --     augroup FormatAutogroup
  --   --       autocmd!
  --   --       autocmd BufWritePost *.java FormatWrite
  --   --     augroup end
  --   --   ]], true)
  --
  --   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  --   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --
  --   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  --
  --   -- Mappings.
  --   local opts = { noremap = true, silent = true }
  --   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --   buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --   buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --   buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --   buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --   buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
  --   buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --   buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --   -- Java specific
  --   buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
  --   buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
  --   buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
  --   buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
  --   buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
  --   buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
  --
  --   buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  --
  --   -- vim.api.nvim_exec([[
  --   --       hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  --   --       hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  --   --       hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  --   --       augroup lsp_document_highlight
  --   --         autocmd!
  --   --         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --   --         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --   --       augroup END
  --   --   ]], false)
  -- end

  -- local root_markers = { 'gradlew', 'pom.xml' }
  -- local root_dir = require('jdtls.setup').find_root(root_markers)
  -- local home = os.getenv('HOME')

  -- local capabilities = {
  --   workspace = {
  --     configuration = true
  --   },
  --   textDocument = {
  --     completion = {
  --       completionItem = {
  --         snippetSupport = true
  --       }
  --     }
  --   }
  -- }

  -- local config = {
  --   flags = {
  --     allow_incremental_sync = true,
  --   },
  --   capabilities = capabilities,
  --   on_attach = on_attach,
  -- }

  config.settings = {
    java = {
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      -- eclipse = {
      -- 	downloadSources = true,
      -- },
      -- implementationsCodeLens = {
      -- 	enabled = true,
      -- },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
          -- flags = {
          -- 	allow_incremental_sync = true,
          -- },
        },
        useBlocks = true,
      },
      -- configuration = {
      --     runtimes = {
      --         {
      --             name = "java-17-openjdk",
      --             path = "/usr/lib/jvm/default-runtime/bin/java"
      --         }
      --     }
      -- }
      -- project = {
      -- 	referencedLibraries = {
      -- 		"**/lib/*.jar",
      -- 	},
      -- },
    },
  }
  -- config.cmd = { 'java-lsp', workspace_folder }
  -- config.cmd = { 'java-lsp.sh', home .. "/.config/nvim/lua/jdtls/" }
  -- config.cmd = { "/.config/nvim/lua/jdtls/java-lsp.sh" }
  -- config.cmd = {
  --   --
  --   -- 				-- 💀
  --   "java", -- or '/path/to/java17_or_newer/bin/java'
  --   -- depends on if `java` is in your $PATH env variable and if it points to the right version.
  --
  --   "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  --   "-Dosgi.bundles.defaultStartLevel=4",
  --   "-Declipse.product=org.eclipse.jdt.ls.core.product",
  --   "-Dlog.protocol=true",
  --   "-Dlog.level=ALL",
  --   "-Xmx1g",
  --   "-javaagent:" .. lombok_path,
  --   "--add-modules=ALL-SYSTEM",
  --   "--add-opens",
  --   "java.base/java.util=ALL-UNNAMED",
  --   "--add-opens",
  --   "java.base/java.lang=ALL-UNNAMED",
  --
  --   -- 💀
  --   "-jar",
  --   path_to_jar,
  --   -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
  --   -- Must point to the                                                     Change this to
  --   -- eclipse.jdt.ls installation                                           the actual version
  --
  --   -- 💀
  --   "-configuration",
  --   path_to_config,
  --   -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
  --   -- Must point to the                      Change to one of `linux`, `win` or `mac`
  --   -- eclipse.jdt.ls installation            Depending on your system.
  --
  --   -- 💀
  --   -- See `data directory configuration` section in the README
  --   "-data",
  --   workspace_dir,
  -- }

  config.on_attach = on_attach
  config.capabilities = capabilities
  config.on_init = function(client, _)
    client.notify('workspace/didChangeConfiguration', { settings = config.settings })
  end

  -- local jar_patterns = {
  --     '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
  --     '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
  --     '/dev/microsoft/vscode-java-test/server/*.jar',
  -- }

  -- local bundles = {}
  -- for _, jar_pattern in ipairs(jar_patterns) do
  --   for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
  --     if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
  --       table.insert(bundles, bundle)
  --     end
  --   end
  -- end

  local extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  config.init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
  }

  -- UI
  local finders = require 'telescope.finders'
  local sorters = require 'telescope.sorters'
  local actions = require 'telescope.actions'
  local pickers = require 'telescope.pickers'
  require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
      prompt_title    = prompt,
      finder          = finders.new_table {
        results = items,
        entry_maker = function(entry)
          return {
            value = entry,
            display = label_fn(entry),
            ordinal = label_fn(entry),
          }
        end,
      },
      sorter          = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr)
        actions.goto_file_selection_edit:replace(function()
          local selection = actions.get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)

          cb(selection.value)
        end)

        return true
      end,
    }):find()
  end

  -- Server
  require('jdtls').start_or_attach(config)

  -- Keymaps
  require("jdtls.keymaps")
end

return M
