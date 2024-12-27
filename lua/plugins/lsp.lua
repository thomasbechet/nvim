return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "lvimuser/lsp-inlayhints.nvim"
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
    })
    require("lsp-inlayhints").setup()

    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
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

    lspconfig.tsserver.setup {}

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("lspconfig").clangd.setup({
      capabilities = capabilities
      --[[ capabilities = {
        textDocument = {
          inactiveRegionsCapabilities = {
            inactiveRegions = true,
          },
        },
      }, ]]
    })

    -- Lsp Configuration
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Enable inlayhints
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)

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
