return {
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/playground", 
  build = ':TSUpdate',
  config =function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'vim', 'vimdoc' },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false, },
      ident = { enable = true }
    })
  end
}
