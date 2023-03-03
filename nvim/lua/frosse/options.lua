vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.history = 500
vim.opt.showcmd = true
vim.opt.gdefault = true
vim.opt.gcr = "a:blinkon500-blinkwait500-blinkoff500"
vim.opt.cursorline = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.mouse="a"
vim.opt.showmatch = true
vim.opt.fileencoding="utf-8"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.lazyredraw = true
vim.opt.hidden = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false

vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 5
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false
vim.opt.shortmess="aFc"
vim.opt.path:append "**"
vim.opt.encoding = "UTF-8"
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.listchars = {
 tab= "\\ \\" ,trail= "·" }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")
