require("telescope").load_extension("harpoon")

local harpoon = require("harpoon")
harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "󰛢 Harpoon 󰛢",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    l = {
        a = {
            function()
                harpoon:list():select(1)
            end,
            "󰛢 󰬺 Harpoon go to one",
        },
        s = {
            function()
                harpoon:list():select(2)
            end,
            "󰛢 󰬻 Harpoon go to two",
        },
        d = {
            function()
                harpoon:list():select(3)
            end,
            "󰛢 󰬼 Harpoon go to three",
        },
        f = {
            function()
                harpoon:list():select(4)
            end,
            "󰛢 󰬽 Harpoon go to four",
        },
        q = {
            function()
                harpoon:list():select(5)
            end,
            "󰛢 󰬾 Harpoon go to five",
        },
        w = {
            function()
                harpoon:list():select(6)
            end,
            "󰛢 󰬿 Harpoon go to six",
        },
        e = {
            function()
                harpoon:list():select(7)
            end,
            "󰛢 󰭀 Harpoon go to seven",
        },
        r = {
            function()
                harpoon:list():select(8)
            end,
            "󰛢 󰭁 Harpoon go to eight",
        },
        z = {
            function()
                harpoon:list():select(9)
            end,
            "󰛢 󰭂 Harpoon go to nine",
        },
        x = {
            function()
                harpoon:list():select(10)
            end,
            "󰛢 󰿩 Harpoon go to ten",
        },
        c = {
            function()
                harpoon:list():select(11)
            end,
            "󰛢 󰬺󰬺 Harpoon go to eleven",
        },
        v = {
            function()
                harpoon:list():select(12)
            end,
            "󰛢 󰬺󰬻 Harpoon go to twelwe",
        },
    },
    m = {
        name = "Harpoon (Marks sticky)",
        t = {
            function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            "󰛢 󱚌 Harpoon [M]enu [T]ext",
        },
        a = {
            function()
                harpoon:list():add()
            end,
            "󰛢  Harpoon [M]ark [A]dd File",
        },
        m = {
            function()
                toggle_telescope(harpoon:list())
            end,
            "󰛢  Harpoon [M]enu Telescope",
        },
    },
}

which_key.register(mappings, opts)

-- vim.keymap.set("n", "<leader>ma", mark.add_file, { desc = "Harpoon [M]ark [A]dd File" })
-- vim.keymap.set("n", "<leader>mm", ui.toggle_quick_menu, { desc = "Harpoon [M]enu of [M]arks" })

vim.keymap.set("n", "[k", function()
    harpoon.list():prev()
end, { desc = "Harpoon go to Previous File" })
vim.keymap.set("n", "]k", function()
    harpoon.list():next()
end, { desc = "Harpoon go to Next File" })

-- vim.keymap.set("n", "<leader>mj", function()
--     ui.nav_file(2)
-- end, { desc = "Harpoon go to [M] [J]two" })
-- vim.keymap.set("n", "<leader>mk", function()
--     ui.nav_file(3)
-- end, { desc = "Harpoon go to [M] [K]three" })
-- vim.keymap.set("n", "<leader>ml", function()
--     ui.nav_file(4)
-- end, { desc = "Harpoon go to [M] [L]four" })
