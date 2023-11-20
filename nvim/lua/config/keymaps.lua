vim.g.mapleader = ";"

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

local opts = { noremap = true, silent = true }

local nmappings = {
  -- move
  { from = "ji",           to = "<ESC>",                         mode = mode_i },
  { from = "<C-s>",        to = "<ESC>:w<CR>",                   mode = mode_i },
  { from = "S",            to = ":w<CR>" },
  { from = "Q",            to = ":wq<CR>" },
  { from = "J",            to = "5j" },
  { from = "K",            to = "5k" },
  { from = "<C-h>",        to = "<left>",                        mode = mode_i },
  { from = "<C-j>",        to = "<down>",                        mode = mode_i },
  { from = "<C-k>",        to = "<up>",                          mode = mode_i },
  { from = "<C-l>",        to = "<right>",                       mode = mode_i },
  { from = "H",            to = "^",                             mode = mode_nv },
  { from = "L",            to = "$",                             mode = mode_nv },


  -- window
  { from = "<C-h>",        to = "<C-w>h" },
  { from = "<C-j>",        to = "<C-w>j" },
  { from = "<C-k>",        to = "<C-w>k" },
  { from = "<C-l>",        to = "<C-w>l" },
  { from = "<up>",         to = ":res -5<CR>",                   opts = opts },
  { from = "<down>",       to = ":res +5<CR>",                   opts = opts },
  { from = "<left>",       to = ":vertical resize-5<CR>",        opts = opts },
  { from = "<right>",      to = ":vertical resize+5<CR>",        opts = opts },

  -- other
  { from = "<leader><CR>", to = ":nohlsearch<CR>" },
  { from = "<leader>rc",   to = ":e ~/.config/nvim/init.lua<CR>" },
  { from = "<leader>rv",   to = ":e .vim.lua<CR>" },

  -- NvimTree 目录树
  -- Buffers 跳转
  { from = "<TAB>",        to = "<CMD>BufferLineCycleNext<CR>" },
  { from = "<S-TAB>",      to = "<CMD>BufferLineCyclePrev<CR>" },
}

for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, mapping.opts or { noremap = true })
end
