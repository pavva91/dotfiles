local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
    mode = "n",  -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    l = {
        a = {
            function()
                ui.nav_file(1)
            end,
            "Harpoon go to one",
        },
        s = {
            function()
                ui.nav_file(2)
            end,
            "Harpoon go to two",
        },
        d = {
            function()
                ui.nav_file(3)
            end,
            "Harpoon go to three",
        },
        f = {
            function()
                ui.nav_file(4)
            end,
            "Harpoon go to four",
        },
        q = {
            function()
                ui.nav_file(5)
            end,
            "Harpoon go to five",
        },
        w = {
            function()
                ui.nav_file(6)
            end,
            "Harpoon go to six",
        },
        e = {
            function()
                ui.nav_file(7)
            end,
            "Harpoon go to seven",
        },
        r = {
            function()
                ui.nav_file(8)
            end,
            "Harpoon go to eight",
        },
        z = {
            function()
                ui.nav_file(9)
            end,
            "Harpoon go to nine",
        },
        x = {
            function()
                ui.nav_file(10)
            end,
            "Harpoon go to ten",
        },
        c = {
            function()
                ui.nav_file(11)
            end,
            "Harpoon go to eleven",
        },
        v = {
            function()
                ui.nav_file(12)
            end,
            "Harpoon go to twelwe",
        },
    },
    m = {
        name = "Harpoon (Marks sticky)",
        m = {
            ui.toggle_quick_menu,
            "Harpoon [M]enu of [M]arks",
        },
        a = {
            mark.add_file,
            "Harpoon [M]ark [A]dd File",
        },
        h = {
            function()
                ui.nav_file(1)
            end,
            "Harpoon go to [M] [H] one",
        },
        j = {
            function()
                ui.nav_file(2)
            end,
            "Harpoon go to [M] [J] two",
        },
        k = {
            function()
                ui.nav_file(3)
            end,
            "Harpoon go to [M] [K] three",
        },
        l = {
            function()
                ui.nav_file(4)
            end,
            "Harpoon go to [M] [l] four",
        },
    },
}

which_key.register(mappings, opts)

-- vim.keymap.set("n", "<leader>ma", mark.add_file, { desc = "Harpoon [M]ark [A]dd File" })
-- vim.keymap.set("n", "<leader>mm", ui.toggle_quick_menu, { desc = "Harpoon [M]enu of [M]arks" })

vim.keymap.set("n", "[k", function()
    ui.nav_prev()
end, { desc = "Harpoon go to Previous File" })
vim.keymap.set("n", "]k", function()
    ui.nav_next()
end, { desc = "Harpoon go to Next File" })

vim.keymap.set("n", "<leader>mh", function()
    ui.nav_file(1)
end, { desc = "Harpoon go to [M] [H]one" })

-- vim.keymap.set("n", "<leader>mj", function()
--     ui.nav_file(2)
-- end, { desc = "Harpoon go to [M] [J]two" })
-- vim.keymap.set("n", "<leader>mk", function()
--     ui.nav_file(3)
-- end, { desc = "Harpoon go to [M] [K]three" })
-- vim.keymap.set("n", "<leader>ml", function()
--     ui.nav_file(4)
-- end, { desc = "Harpoon go to [M] [L]four" })
