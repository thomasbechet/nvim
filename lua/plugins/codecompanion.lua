return {
  'olimorris/codecompanion.nvim',
  -- dev = true,
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'lalitmee/codecompanion-spinners.nvim',
  },
  cmd = {
    'CodeCompanion',
    'CodeCompanionChat',
    'CodeCompanionToggle',
    'CodeCompanionActions',
  },
  opts = {

    -- This 'strategies' table sets the DEFAULT AI PROVIDER and MODEL
    -- for different categories of actions within the plugin.
    strategies = {

      -- Configures the default model for running custom prompts.
      cmd = {
        adapter = "ollama",
        model = "codegemma:2b",
      },

      -- Configures the model for the interactive chat window (:CompanionChat).
      chat = {
        adapter = "ollama",
        model = "codegemma:2b",
      },

      -- Configures the model for any action that modifies code directly in your buffer
      -- using the 'inline' strategy.
      inline = {
        adapter = "ollama",
        model = "qwen3.5:4b",
      },
    },

    extensions = {
      spinner = {
        opts = {
          style = "native",
        },
      },
    },
  },
}
