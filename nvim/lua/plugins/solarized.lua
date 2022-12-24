-----------------------------------------------------------
-- Настройка для плагина solarized colorscheme
-----------------------------------------------------------
-- Plugin: solarized
-- https://github.com/shaunsingh/solarized.nvim

vim.g.solarized_italic_comments = true
vim.g.solarized_italic_keywords = true
vim.g.solarized_italic_functions = true
vim.g.solarized_italic_variables = false
vim.g.solarized_contrast = true
vim.g.solarized_borders = true
vim.g.solarized_disable_background = false

require('solarized').set()
