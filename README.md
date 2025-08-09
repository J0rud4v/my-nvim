# Configuración de Neovim con JDTLS, LSPs y DAP

Este repositorio contiene mi configuración personalizada de **Neovim 0.10+** orientada al desarrollo en **Java** con soporte para depuración y múltiples lenguajes mediante LSPs.  
Está diseñada para ser **estable**, **rápida** y fácil de extender, usando `lazy.nvim` como gestor de plugins.

## ✨ Características principales

- **Java** con `nvim-jdtls` y soporte para:
  - Depuración (`nvim-dap` + `dap-ui` + `dap-virtual-text`)
  - Autocompletado y acciones rápidas
  - Integración con proyectos Maven/Gradle y archivos sueltos
- **Otros lenguajes** soportados mediante `nvim-lspconfig` y `mason.nvim`:
  - `pyright` (Python)
  - `ts_ls` (JavaScript / TypeScript)
  - `bash_ls` (Bash)
  - Y más según se instalen desde Mason
- **Árbol de archivos** con `nvim-tree.lua`
- **Búsqueda avanzada** con `telescope.nvim`
- **Resaltado avanzado** con `nvim-treesitter`
- **Git integrado** (`vim-fugitive`, `gitsigns.nvim`)
- **Barra de estado y bufferline** (`lualine.nvim`, `bufferline.nvim`)
- **Previsualización de Markdown** con `glow.nvim`
- **Soporte para notebooks** con `jupytext.nvim`
- **Autopares** con `nvim-autopairs`
- **Integración con Windsurf** *(autocompletado fantasma en algunos lenguajes)*

---

## 📦 Plugins incluidos (lazy.nvim)

### Productividad
- `nvim-cmp`
- `nvim-treesitter`
- `nvim-tree.lua`
- `telescope.nvim`
- `nvim-autopairs`

### Lenguajes y LSP
- `nvim-jdtls`
- `mason.nvim`
- `nvim-lspconfig`
- `mason-lspconfig.nvim`
- `mason-tool-installer.nvim`

### Depuración
- `nvim-dap`
- `nvim-dap-ui`
- `nvim-dap-virtual-text`

### Git
- `vim-fugitive`
- `gitsigns.nvim`

### Estética
- `night-owl.nvim`
- `lualine.nvim`
- `bufferline.nvim`

### Extras
- `windsurf.nvim`
- `glow.nvim`
- `jupytext.nvim`

---

## ⚙️ Requisitos

- **Neovim 0.10+**
- **JDK 21 o superior**
- **Node.js** (para LSPs como `ts_ls`)
- **Python 3** (para `pyright`)
- **Git**
- **Glow** (para previsualizar Markdown)

Instalar Glow en Debian/Ubuntu:

    sudo apt install glow

---

## 🚀 Instalación

1. Clonar este repositorio en la carpeta de configuración de Neovim:

    git clone https://github.com/tuusuario/nvim ~/.config/nvim

2. Abrir Neovim e instalar plugins:

    :Lazy sync

3. Instalar LSPs y herramientas con Mason:

    :MasonInstallAll

4. (Opcional) Verifica que `java -version` muestre la JDK 21+.

---

## 🖥️ Uso rápido

- **Abrir un proyecto Java**: JDTLS se activará automáticamente.
- **Explorar archivos**: `<leader>e`
- **Buscar archivos**: `<leader>ff`
- **Buscar texto**: `<leader>fg`
- **Iniciar depuración**: `<F5>`

---

## ⌨️ Atajos de teclado

| Acción | Atajo |
|--------|-------|
| Abrir árbol de archivos | `<leader>e` |
| Buscar archivo | `<leader>ff` |
| Buscar texto | `<leader>fg` |
| Previsualizar Markdown | `:Glow` |
| Iniciar depuración | `<F5>` |
| Paso siguiente (debug) | `<F10>` |
| Entrar (debug) | `<F11>` |
| Salir (debug) | `<F12>` |
| Previsualizar cambio Git | `<leader>hp` |
| Ir a cambio siguiente | `]c` |
| Ir a cambio anterior | `[c` |

---

## 🐞 Solución de problemas

- **Error JDTLS / JVM**:  
  Comprueba que usas JDK 21+ con:

        java -version

- **LSP no inicia**:  
  Abre Mason con `:Mason` e instala el servidor correspondiente.

- **Debugger no funciona**:  
  Verifica adaptadores y dependencias de `nvim-dap` para Java.

- **Windsurf no autocompleta**:  
  Está limitado a ciertos lenguajes (`java`, `lua`, `php`) por defecto.

---

## 📷 Capturas (Opcional)

Puedes agregar capturas con:

    ![captura-1](ruta/a/imagen1.png)
    ![captura-2](ruta/a/imagen2.png)

---

## 📄 Licencia

Este proyecto está bajo licencia **MIT**.

