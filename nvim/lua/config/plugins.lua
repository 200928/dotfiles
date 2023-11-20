local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("config.plugins.nvim-tree"),
    require("config.plugins.git"),
    require("config.plugins.fzf"),
    require("config.plugins.colorscheme"),
    require("config.plugins.trouble"),
    require("config.plugins.autocomplete").config,
    require("config.plugins.lualine"),
    require("config.plugins.bufferline"),
    require("config.plugins.telescope").config,
    require("config.plugins.yank"),
    require("config.plugins.dap"),
    require("config.plugins.treesitter"),
    require("config.plugins.comment"),
    require("config.plugins.lspconfig").config,
    require("config.plugins.indent"),
    require("config.plugins.scrollbar"),
    require("config.plugins.wilder"),
    require("config.plugins.window-management"),
    require("config.plugins.vimcdoc"),
    require("config.plugins.multi-cursor"),
    require("config.plugins.snippets"),
    require("config.plugins.surround"),
    require("config.plugins.cellular-automata"),
    require("config.plugins.autopairs"),
    require("config.plugins.flash"),
    require("config.plugins.copilot"),
    require("config.plugins.rnvimr"),
    require("config.plugins.trans"),
    -- require("config.plugins.winbar"),
    -- require("config.plugins.noice"),
}, {})
