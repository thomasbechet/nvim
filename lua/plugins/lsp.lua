return {
  {
    'simrat39/rust-tools.nvim',
    opts = {
      tools = {
        runnables = { use_telescope = true },
        inlay_hints = {
          auto = true,
          show_paramater_hints = true,
          parameter_hints_prefix = '',
          other_hints_prefix = '',
        }
      },
      server = {
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = { command = 'clippy' }},
          },
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
          end
        }
      },
    },
    {
      'hrsh7th/nvim-cmp',
      config = function()
        local cmp = require('cmp')
        cmp.setup({
          preselect = cmp.PreselectMode.None,
          snippet = {
            expand = function(args)
              vim.fn['vsnip#anonymous'](args.body)
            end,
          },
          mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            -- Add tab support
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }),
          },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'path' },
            { name = 'buffer' },
          },
        })
      end
    },
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        {'neovim/nvim-lspconfig'},             -- Required
        {'simrat39/rust-tools.nvim'},
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
        {'hrsh7th/nvim-cmp'},     -- Required
        {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-vsnip',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-buffer',
          after = { 'hrsh7th/nvim-cmp' },
          requires = { 'hrsh7th/nvim-cmp' },
        },
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      },
      opts = {},
      config = function()
        local lsp = require('lsp-zero').preset({})
        lsp.preset('recommended')
        lsp.ensure_installed({
          'rust_analyzer',
        })
      end
    }
  }

