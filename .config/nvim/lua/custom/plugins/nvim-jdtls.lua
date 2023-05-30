return {
    -- https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
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
        local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
        local lombok_path = path_to_jdtls .. "/lombok.jar"
        local path_to_jdebug = home .. "/.local/share/nvim/mason/packages/java-debug-adapter"
        local path_to_jtest = home .. "/.local/share/nvim/mason/packages/java-test"
        local bundles = {
            vim.fn.glob(path_to_jdebug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
        }

        local extendedClientCapabilities = jdtls.extendedClientCapabilities
        extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
        vim.list_extend(bundles, vim.split(vim.fn.glob(path_to_jtest .. "/extension/server/*.jar", true), "\n"))

        -- Main Config
        local config = {
            -- 			-- The command that starts the language server
            -- 			-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
            cmd = {
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
            },

            -- 💀
            -- This is the default if not provided, you can remove it. Or adjust as needed.
            -- One dedicated LSP server & client will be started per unique root_dir
            -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
            -- root_dir = root_dir,

            -- Here you can configure eclipse.jdt.ls specific settings
            -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
            -- for a list of options
            settings = {
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
            },
            flags = {
                allow_incremental_sync = true,
            },
            on_attach = function(client, bufnr)
                jdtls.setup_dap({ hotcodereplace = "auto" })
                jdtls_dap.setup_dap_main_class_configs()
                jdtls_setup.add_commands()
                require("lsp_signature").on_attach({
                    bind = true,
                    padding = '',
                    handler_opts = {
                        border = "rounded"
                    }
                }, bufnr)
            end,
            --
            -- 			-- Language server `initializationOptions` (init_options)
            -- 			-- You need to extend the `bundles` with paths to jar files
            -- 			-- if you want to use additional eclipse.jdt.ls plugins.
            -- 			--
            -- 			-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
            -- 			--
            -- 			-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
            init_options = {
                bundles = bundles,
                extendedClientCapabilities = extendedClientCapabilities,
            },
        }

        -- 		-- This starts a new client & server,
        -- 		-- or attaches to an existing client & server depending on the `root_dir`.
        jdtls.start_or_attach(config)

        -- 		-- vim/_editor.lua:0: Vim:No LSP client found that supports vscode.java.resolveMainClass
        -- 		require("jdtls.setup").add_commands() -- not related to debugging but you probably want this
        --
        -- 		-- vim.cmd(
        -- 		-- 	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
        -- 		-- )
        -- 		-- vim.cmd(
        -- 		-- 	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
        -- 		-- )
        -- 		-- vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
        -- 		-- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
        -- 		-- vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
        -- 		-- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"
        --
        -- 		-- local status_ok, which_key = pcall(require, "which-key")
        -- 		-- if not status_ok then
        -- 		-- 	return
        -- 		-- end
        --
        -- 		-- local opts = {
        -- 		-- 	mode = "n", -- NORMAL mode
        -- 		-- 	prefix = "<leader>",
        -- 		-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        -- 		-- 	silent = true, -- use `silent` when creating keymaps
        -- 		-- 	noremap = true, -- use `noremap` when creating keymaps
        -- 		-- 	nowait = true, -- use `nowait` when creating keymaps
        -- 		-- }
        --
        -- 		-- local vopts = {
        -- 		-- 	mode = "v", -- VISUAL mode
        -- 		-- 	prefix = "<leader>",
        -- 		-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        -- 		-- 	silent = true, -- use `silent` when creating keymaps
        -- 		-- 	noremap = true, -- use `noremap` when creating keymaps
        -- 		-- 	nowait = true, -- use `nowait` when creating keymaps
        -- 		-- }
        --
        -- 		-- local mappings = {
        -- 		-- 	L = {
        -- 		-- 		name = "Java",
        -- 		-- 		o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
        -- 		-- 		v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
        -- 		-- 		c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
        -- 		-- 		t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
        -- 		-- 		T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
        -- 		-- 		u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
        -- 		-- 	},
        -- 		-- }
        --
        -- 		-- local vmappings = {
        -- 		-- 	L = {
        -- 		-- 		name = "Java",
        -- 		-- 		v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
        -- 		-- 		c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
        -- 		-- 		m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
        -- 		-- 	},
        -- 		-- }
        --
        -- 		-- which_key.register(mappings, opts)
        -- 		-- which_key.register(vmappings, vopts)
    end,
}
