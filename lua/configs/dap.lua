local dap = require("dap")

dap.adapters.python = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
  args = { '-m', 'debugpy.adapter' }
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    pythonPath = function()
      return '/usr/bin/python3' -- Ajusta esto a tu ruta de Python
    end,
  },
}

--require('jdtls.dap').setup_dap_main_class_configs()

-- Atajos de teclado para nvim-dap
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Iniciar/Continuar depuración" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Paso por encima" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Paso adentro" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Paso afuera" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Alternar punto de interrupción" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Condición del punto de interrupción: "))
end, { desc = "Punto de interrupción condicional" })
