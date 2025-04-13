local lspconfig = require("lspconfig")
local jdtls = require("jdtls")
local jdtls_dap = require("jdtls.dap")
local mason_path = vim.fn.stdpath("data") .. "/mason"

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Helper function for creating keymaps
local function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Regular Neovim LSP client keymappings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
  nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
  nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
  nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
  nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
  nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
  nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  nnoremap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, "List workspace folders")
  nnoremap('<leader>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  nnoremap('<leader>rn', vim.lsp.buf.rename, bufopts, "Rename")
  nnoremap('<leader>ca', vim.lsp.buf.code_action, bufopts, "Code actions")
  vim.keymap.set('v', "<leader>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" })
  nnoremap('<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
end

local on_attach_java = function(client, bufnr)
  on_attach(client, bufnr)

  jdtls.setup_dap({ hotcodereplace = "auto" })
  jdtls_dap.setup_dap_main_class_configs()
  jdtls.setup.add_commands()

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("<leader>ev", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("<leader>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set('v', "<leader>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()


lspconfig.bashls.setup({
  simple_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.pyright.setup({
  simple_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  simple_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.env.MANSECT
        }
      }
    }
  }
})







local uv = vim.loop
local debug_path = vim.fn.glob(mason_path ..
"/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
local test_bundles = vim.split(vim.fn.glob(mason_path .. "/packages/java-test/extension/server/*.jar"), "\n")
local bundles = {}
if debug_path ~= "" then
  table.insert(bundles, debug_path)
end

local function limited_root_pattern(markers, max_levels)
  local path = vim.fn.expand("%:p:h")
  local levels = 0

  while path and path ~= "/" and levels < max_levels do
    for _, marker in ipairs(markers) do
      if vim.fn.filereadable(path .. "/" .. marker) == 1 or vim.fn.isdirectory(path .. "/" .. marker) == 1 then
        return path
      end
    end
    path = uv.fs_realpath(path .. "/..")
    levels = levels + 1
  end

  return nil
end
local root_dir = limited_root_pattern(
{ ".git", "build.gradle", "build.gradle.kts", "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts" }, 5) or
vim.fn.getcwd()

lspconfig.jdtls.setup({
  simple_file_support = true,
  capabilities = capabilities,
  on_attach = on_attach_java,
  root_dir = root_dir,

  vim.list_extend(bundles, test_bundles),
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      inlayHints = {
        parameterNames = { enabled = "all" },
      },
    },
  },
  init_options = {
    bundles = bundles,
  },
})
