return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      provider = "none", -- no UI actions; server + tools remain available
    },
    diff_opts = {
      layout = "horizontal",   -- "vertical" or "horizontal" split for the diff
      open_in_new_tab = false, -- keep the diff in your current tab/window layout instead of a new tab
      keep_terminal_focus = false,
      hide_terminal_in_new_tab = false,
      on_new_file_reject = "keep_empty", -- "keep_empty" or "close_window"
    },
  },
}
