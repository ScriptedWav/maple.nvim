local function nvim_lspconfig()

    vim.g.zig_fmt_autosave = 0

    return { "neovim/nvim-lspconfig", -- Nvim LSP Config

        config = function ()
            
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup{}

            lspconfig.zls.setup({})
            
        end
        
    }

end

local function nvim_cmp()

    return {"hrsh7th/nvim-cmp",

        config = function ()
            local cmp = require("cmp")
            cmp.setup({     
                sources = {
                    { name = "nvim_lsp" }
                },

                mapping = {

                    ["<Down>"] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Select 
                    }),

                    ["<Up>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Select
                    }),

                    ["<Tab>"] = cmp.mapping(function(fallback)

                        if cmp.visible() then
                            cmp.confirm({
                                select = true
                            })
                        else
                            fallback()
                        end

                    end, { "i", "s" })

                },

                completion = {
                    autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
                }
            })
        end

    }

end

local function cmp_nvim_lsp()
    return {"hrsh7th/cmp-nvim-lsp",
        config = function ()
            
        end
    }
end

local function lazydev()
    return {"folke/lazydev.nvim",

        ft = "lua",

        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            }
        }

    }
end

return {
    nvim_lspconfig(),
    nvim_cmp(),
    cmp_nvim_lsp(),
    lazydev()
}