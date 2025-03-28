local function treesitter()
    return { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "zig", "markdown" },
                highlight = {
                    enable = true,
                }
            }
        end
    }
end

return {
    treesitter()
}