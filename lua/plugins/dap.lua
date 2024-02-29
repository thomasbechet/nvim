return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'theHamsta/nvim-dap-virtual-text'
  },
  config = function()
    require('nvim-dap-virtual-text').setup()

    vim.keymap.set("n", "<leader>dd", function() require('dap').continue() end)
    vim.keymap.set("n", "<leader>dD", function() require("dap").terminate() end)
    vim.keymap.set("n", "<leader>db", function() require('dap').toggle_breakpoint() end)
    vim.keymap.set("n", "<leader>dc", function() require('dap').continue() end)
    vim.keymap.set("n", "<leader>dj", function() require('dap').step_over() end)
    vim.keymap.set("n", "<leader>dk", function() require('dap').step_out() end)
    vim.keymap.set("n", "<leader>dl", function() require('dap').step_into() end)
    vim.keymap.set("n", "<leader>dR", function() require('dap').repl.open({}) end)
    vim.keymap.set("n", "<leader>dr", function() require("dap").restart() end)
    vim.keymap.set({'n', 'v'}, '<leader>dh', function() require('dap.ui.widgets').hover() end)
    vim.keymap.set({'n', 'v'}, '<leader>dp', function() require('dap.ui.widgets').preview() end)
    vim.keymap.set('n', '<leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)


    local dap = require('dap')

    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = '/usr/bin/codelldb',
            args = { "--port", "${port}" },
            detached = false,
        }
    }

   -- Default debug configuration for C, C++
   dap.configurations.rust = {
       {
           name = "Debug an Executable",
           type = "codelldb",
           request = "launch",
           program = function()
               return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
           end,
           cwd = "${workspaceFolder}",
           stopOnEntry = false,
       },
   }

  end
}
