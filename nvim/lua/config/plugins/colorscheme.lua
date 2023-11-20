return {
    {
        "theniceboy/nvim-deus",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-macchiato]])
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        -- 	vim.cmd([[colorscheme deus]])
        -- end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    { "rebelot/kanagawa.nvim",        priority = 1000 },
    { "nyoom-engineering/nyoom.nvim", priority = 1000 },
    { "savq/melange-nvim" },
}
