local options = {
    backup = false, -- 不使用备份
    number = true,
    clipboard = "unnamedplus",
    relativenumber = true,
    timeoutlen = 250, -- 组合按键时间间隔
    cursorline = true,
    guifont = "monospace:h24",
    encoding = "utf-8",
    -- 缩进
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,  -- Tab键和空格键的行为一致，即Tab键插入空格而非Tab字符
    -- 保持光标的位置
    scrolloff = 8,     -- keep 8 height offset from above and bottom
    sidescrolloff = 8, -- keep 8 width offset from left and right
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
