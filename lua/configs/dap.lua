local dap = require("dap")

dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' }
}
dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return '/usr/bin/python'  -- Ajusta esto a tu ruta de Python
          end,
        },
      }
-- Configuración del adaptador para Java
dap.adapters.java = {
  type = "executable",
  command = "java",
  args = {
    "-jar",
    vim.fn.expand("~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
  },
}

-- Configuración de la depuración para Java
dap.configurations.java = {
  {
    type = "java",
    request = "launch",
    name = "Debug (Attach) - Remote",
    hostName = "127.0.0.1",
    port = 5005,
  },
}

-- Atajos de teclado para nvim-dap
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Iniciar/Continuar depuración" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Paso por encima" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Paso adentro" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Paso afuera" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Alternar punto de interrupción" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Condición del punto de interrupción: "))
end, { desc = "Punto de interrupción condicional" })
