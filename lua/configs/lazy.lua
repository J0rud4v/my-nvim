return {

  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gdiffsplit', 'Gvdiffsplit', 'Gwrite' } -- carga solo cuando uses estos comandos
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
          vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr })
          vim.keymap.set('n', '[c', gs.prev_hunk, { buffer = bufnr })
          vim.keymap.set('n', ']c', gs.next_hunk, { buffer = bufnr })
        end
      }
    end
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.opt.termguicolors = true
      require("configs.bufferline")
    end,
  },
  -- Instalacion de glow para vista previa de markdown
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "dark", -- o "light" si usas fondo claro
        width = 120,    -- ancho del buffer flotante
        border = "none"
      })
    end
  },
  -- Instalacion de la ia windsurf IA de autocompletado
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    ft = { "java", "lua", "php" },
    config = function()
      vim.g.codeium_enabled = false
      require("configs.windsurf").setup()
    end,
  },
  {
    'goerz/jupytext.nvim',
    version = '0.2.0',
    opts = {
      jupytext = 'jupytext',
      format = 'py:percent',
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})

      -- integración con nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.dap")
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    ft = "java",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      require("configs.dapui")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('configs.lualine')
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-cmdline"
    },
    config = function()
      require("configs.nvimcmp")
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function()
      return require "configs.telescope"
    end
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("configs.themes.nightowl") -- Cargar configuración externa del tema
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
    opts = function()
      return require("configs.mason")
    end,
    config = function(_, opts)
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "cpp",
        "python",
        "java",
        "javadoc",
        "yaml",
        "bash",
        "json",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
}
