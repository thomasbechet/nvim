return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { '<leader>tn', '<Cmd>Trouble<CR>', desc = 'Trouble' },
    { '<leader>tt', '<Cmd>TroubleToggle<CR>', desc = 'Trouble Toggle' },
    { '<leader>tr', '<Cmd>TroubleRefresh<CR>', desc = 'Trouble Refresh' },
  },
}
