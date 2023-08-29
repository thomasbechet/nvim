return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        'node_modules',
        '.git',
        'target',
      },
    },
  },
  keys = {
    {
      '<leader>ff',
      function() require('telescope.builtin').find_files() end
    },
    {
      '<leader>fb',
      function() require('telescope.builtin').buffers() end
    },
    {
      '<leader>fh',
      function() require('telescope.builtin').help_tags() end
    },
  },
}
