return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "glsl_analyzer", "zls" },
      automatic_enable = false,
    })

    -- Clangd
    vim.lsp.config("clangd", {
      init_options = {
        fallbackFlags = { '--std=c23' }
      }
    })
    vim.lsp.enable("clangd")

    -- Lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          workspace = {
            library = {
              vim.api.nvim_get_runtime_file("", true),
              "/home/thomas/Projects/nux/core/lua/lsp"
            }
          },
          diagnostics = {
            globals = { "vim" },
            disable = { "duplicate-set-field" }
          },
          format = {
            enable = true,
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
            }
          },
        }
      }
    })
    vim.lsp.enable("lua_ls")

    -- GLSL
    vim.lsp.config("glsl_analyzer", {})
    vim.lsp.enable("glsl_analyzer")

    -- Zig
    vim.lsp.config("zls", {
      -- omit the following line if `zls` is in your PATH
      cmd = { '/home/thomas/Projects/zls-0.15.1/zls' },
      settings = {
        zls = {
          enable_build_on_save = true,
          semantic_tokens = "partial",
          zig_exe_path = '/home/thomas/Projects/zig-x86_64-linux-0.15.2/zig'
        }
      }
    })
    vim.lsp.enable("zls")

    -- Wren
    vim.filetype.add({
      extension = {
        wren = "wren",
      },
    })
    vim.lsp.config("wren_lsp", {
      cmd = { "wren-lsp" },
      filetypes = { "wren" },
      root_dir = "/home/thomas/Projects/nux2/core/wren"
    })
    vim.lsp.enable("wren_lsp")

    -- Odin
    vim.lsp.config("ols", {
      init_options = {
        checker_args = "-strict-style",
        collections = {},
      },
    })
    vim.lsp.enable("ols")

    -- Lsp Configuration
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.diagnostic.open_float, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end,
}
