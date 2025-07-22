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
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99


-- configuracion de windsurf
vim.g.codeium_enabled = false
vim.g.codeium_filetypes_disabled_by_default = true
vim.g.codeium_filetypes = { sh = false, env = false, dosini = false, typescript = true, java = true, lua = true}
vim.g.codeium_disable_bindings = 1

vim.api.nvim_create_user_command("WindsurfLoad", function()
  require("lazy").load({ plugins = { "windsurf.nvim" } })
end, { nargs = 0 })

--Mappings
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>1", vim.cmd.bfirst)
vim.keymap.set("n", "<leader>0", vim.cmd.blast)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
vim.keymap.set('n', '<space><CR>', 'za', { noremap = true, silent = true })


require("base.plugins.lazy")
