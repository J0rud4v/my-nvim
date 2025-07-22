require("bufferline").setup {
  options = {
    show_close_icon = false,
    show_buffer_close_icons = false,
    separator_style = { '', '' },
    modified_icon = " ● ",
    indicator = { style = "none" },
    hover = { enabled = true, delay = 150, reveal = { "close" } },
    --diagnostics = "false",
    diagnostics_update_in_insert = false,
    --numbers = "ordinal",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    custom_filter = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      return ft ~= "qf" and ft ~= "help" and ft ~= "terminal"
    end,
  },

  highlights = {
    --fill = { bg = "#1e1e2e" },
    --background = { fg = "#cdd6f4", bg = "#1e1e2e" },
    --buffer_visible = { fg = "#cdd6f4", bg = "#1e1e2e" },
    buffer_selected = { fg = "#ffffff", bg = "#120035", bold = false },
    --separator = { fg = "#1e1e2e", bg = "#b4befe" },
    --separator_selected = { fg = "#b4befe", bg = "#b4befe" },
    modified = { fg = "#f38ba8"},
    modified_selected = { fg = "#ff0064", bg = "#120035" },
  },
}
