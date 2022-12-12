local opt = vim.opt

-- Indentation
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true
opt.list = true

-- Line numbers
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 3
opt.signcolumn = "yes"
opt.wrap = false

-- Timeout
opt.timeoutlen = 250
-- opt.updatetime = 750

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.lazyredraw = true

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.showmatch = true
opt.inccommand = "nosplit"

-- Completion
opt.pumheight = 10
opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Other options
opt.clipboard = "unnamed"
opt.cmdheight = 1
opt.fileencoding = "utf-8"
opt.mouse = "a"
opt.showtabline = 2

-- Disable backup fils
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.shortmess:append("c")

-- opt.conceallevel = 0
-- opt.showmode = false
-- opt.splitbelow = true
-- opt.splitright = true
-- opt.termguicolors = true
-- opt.history = 100 -- Remember N lines in history
-- opt.hidden = true -- Enable background buffers
