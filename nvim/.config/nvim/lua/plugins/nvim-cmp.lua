return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
        {
            "zbirenbaum/copilot-cmp",
            dependencies = "copilot.lua",
            config = function()
                require("copilot_cmp").setup()
            end,
        },
    },
    opts = function(_, opts)
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        cmp.setup {
            formatting = {
                format = require("lspkind").cmp_format({
                    symbol_map = { Copilot = "" },
                }),
            },
            mapping = {
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() and cmp.get_active_entry() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "buffer" },
                { name = "path" },
                { name = "copilot" },
                { name = "luasnip" },
            },
            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        }

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
