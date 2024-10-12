return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    dependencies = {
        {
            "zbirenbaum/copilot-cmp",
            dependencies = "copilot.lua",
            config = function()
                require("copilot_cmp").setup()
            end
        }
    },
    opts = function(_, opts)
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local cmp = require("cmp")
        cmp.setup {
            sources = {
                { name = "copilot" }
            },
            mapping = {
                ["<CR>"] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                }),
                ["<Tab>"] = function(fallback)
                    if not cmp.select_next_item() then
                        if vim.bo.buftype ~= "prompt" and has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end
                end,
            }
        }
    end
}
