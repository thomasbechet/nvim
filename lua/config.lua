-- Setup leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set default clipboard mode
vim.opt.clipboard = 'unnamedplus'
-- Display lines
vim.wo.relativenumber = true
vim.wo.number = true
-- Disable mouse support
vim.opt.mouse = ''
-- Allow hidden buffers
vim.opt.hidden = true
-- Terminal exit remap
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
-- Ident options
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- Auto reload
vim.opt.autoread = true
vim.opt.updatetime = 300
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermLeave", "WinEnter" },
  {
    pattern = "*",
    command = "checktime",
  }
)
