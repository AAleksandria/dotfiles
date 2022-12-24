-----------------------------------------------------------
-- Конфиг файл для менеджера пакетов
-----------------------------------------------------------
-- Менеджер пакетов: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- проверка что packer установлен
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(fn.stdpath('data'), 'site', 'pack')
})

-- добавление плагинов
return packer.startup(function()
  -- пакер устанавливается сам
  use 'wbthomason/packer.nvim'
  -- файловый менеджер
  use 'kyazdani42/nvim-tree.lua'
  -- иконки
  use 'kyazdani42/nvim-web-devicons'
  -- цветовая тема
  use 'shaunsingh/nord.nvim'
  use 'shaunsingh/solarized.nvim'
  -- панель статуса
  -- use {
  --   'famiu/feline.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  -- }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- tagviewer
  use 'liuchengxu/vista.vim'
  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'
  -- coc
  use {'neoclide/coc.nvim', branch = 'release'}
  -- toggleterm
  use 'akinsho/toggleterm.nvim'
  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  -- autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  -- dashboard
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  --   config = function ()
  --       require'alpha'.setup(require'alpha.themes.dashboard'.opts)
  --   end
  -- }
  -- git labels
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = { 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     require('gitsigns').setup()
  --   end
  -- }
end)
