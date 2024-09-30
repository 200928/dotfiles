return {
  "kevinhwang91/rnvimr",
  config = function()
    vim.keymap.set("t", "<M-i>", "<C-\\><C-n>:RnvimrResize<CR>", { silent = true })
    vim.keymap.set("n", "<M-o>", ":RnvimrToggle<CR>", { silent = true })
    vim.keymap.set("t", "<M-o>", "<C-\\><C-n>:RnvimrToggle<CR>", { silent = false })
    vim.keymap.set("t", "<M-l>", "<C-\\><C-n>:RnvimrResize 1,8,9,11,5", { silent = false })
  end,
}
