local function toggle_peek()
    local peek = require('peek')
    if peek.is_open() then
        peek.close()
    else
        peek.open()
    end
end

return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup({
            app = 'browser'
        })
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        vim.api.nvim_create_user_command("PeekToggle", toggle_peek, {})
    end,
}
