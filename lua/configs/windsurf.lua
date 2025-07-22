return {
  setup = function()
    vim.g.codeium_enabled = false
    require("codeium").setup({
      enable_cmp_source = true, -- puedes desactivarlo si solo usas virtual text
      virtual_text = {
        enabled = true,
        manual = false,
        idle_delay = 75,
        virtual_text_priority = 65535,
        map_keys = true,
        key_bindings = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          clear = "<C-c>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      map_keys = false,
    })
  end,
}
