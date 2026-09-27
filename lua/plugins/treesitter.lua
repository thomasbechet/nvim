return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter')
    treesitter.setup({ install_dir = vim.fn.stdpath('data') .. '/site' })

    local languages = { 'rust', 'lua', 'vim', 'glsl', 'odin' }
    treesitter.install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = languages,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end
}
