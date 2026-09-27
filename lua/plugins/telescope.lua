return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'FindFiles' },
    { '<leader>fg', '<Cmd>Telescope live_grep<CR>',  desc = 'FindLiveGrep' }
  },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = {
          hidden = true
        }
      }
    }
  end
}
