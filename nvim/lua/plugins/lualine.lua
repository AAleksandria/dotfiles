-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------
-- Plugin: lualine.nvim
--- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'filename',
        file_status = true,
        path = 3,
        shorting_target = 40,
        symbols = {
          modified = ' ',
          readonly = '[r]',
          unnamed = '[No Name]',
        }
      }
    },
    lualine_c = {'diagnostics'},
    lualine_x = {'diff','branch'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}
