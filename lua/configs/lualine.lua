require('lualine').setup {
  options = {
    theme = "auto",
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {
        --'dap-repl',
        --'dapui_watches',
        --'dapui_stacks',
        --'dapui_breakpoints',
        --'dapui_scopes',
        --'dapui_console',
        --'NvimTree',
      },
      --winbar = {}, -- si usas winbar y también quieres desactivarlo, puedes especificarlo aquí
    },
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'branch', 'encoding', 'fileformat'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}
