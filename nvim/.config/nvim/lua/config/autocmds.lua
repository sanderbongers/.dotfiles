vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("lazyvim_autoupdate", {}),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false })
        end
    end,
})
