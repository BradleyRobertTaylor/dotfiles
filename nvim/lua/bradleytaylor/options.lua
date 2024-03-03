-- keep fat cursor
vim.opt.guicursor = ""

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = false

-- line wrapping
vim.opt.wrap = false

-- never less than 10 lines when scrolling
vim.opt.scrolloff = 10

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- cursor line
vim.opt.cursorline = true

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- don't show mode since it's in status line
vim.opt.showmode = false

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
