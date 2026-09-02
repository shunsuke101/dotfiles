vim.g.mapleader=" "
vim.g.maplocalleader="\\"

vim.opt.expandtab=true

vim.opt.shiftwidth=8

vim.opt.tabstop=8
vim.opt.softtabstop=8

vim.opt.smarttab=true
vim.opt.smartindent=true
vim.opt.autoindent=true

vim.opt.cursorline=true

--Store undo between session
vim.opt.undofile=true

vim.opt.showmode=false

vim.opt.ignorecase=true
vim.opt.smartcase=true

--vim.opt.signcolumn="yes"


vim.opt.splitright=true
vim.opt.splitbelow=true

vim.opt.clipboard="unnamedplus"
vim.opt.termguicolors=true

require("config.lazy")
        
