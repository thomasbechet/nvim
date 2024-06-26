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
