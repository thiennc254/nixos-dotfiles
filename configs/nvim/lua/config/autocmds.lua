-- Turn off past mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste",
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.wo.spell = false
        vim.wo.conceallevel = 0
    end,
})

-- Disable auto comment
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Auto chmod +x file script
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function()
        local line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
        if line:match("^#!") then
            local file = vim.api.nvim_buf_get_name(0)
            os.execute("chmod +x " .. file)
        end
    end,
})
