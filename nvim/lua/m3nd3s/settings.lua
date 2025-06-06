vim.opt.cursorline = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabpagemax = 20
vim.opt.showtabline = 2
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.showmatch = true
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.backup = false

vim.opt.clipboard = "unnamedplus"

-- Set background to transparent
-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]]
