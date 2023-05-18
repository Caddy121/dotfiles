vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.colorcolumn = "80"
opt.pumblend = 0
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.showmode = false
opt.swapfile = false
-- opt.showtabline = 2

-- hide ~ in sign column
vim.opt.fillchars = vim.opt.fillchars + "eob: "
