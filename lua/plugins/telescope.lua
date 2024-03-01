return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'FindFiles' },
    { '<leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'FindLiveGrep' }
  }
}
