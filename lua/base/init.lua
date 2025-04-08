--Basic settings

vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.list = false
vim.opt.guicursor = "i:ver100"

--Mappings
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>1", vim.cmd.bfirst)
vim.keymap.set("n", "<leader>0", vim.cmd.blast)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)

require("base.plugins.lazy")
