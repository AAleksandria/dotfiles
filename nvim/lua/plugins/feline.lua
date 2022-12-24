-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------
-- Plugin: feline.nvim
--- https://github.com/famiu/feline.nvim

-- For the configuration see the Usage section:
--- https://github.com/famiu/feline.nvim/blob/master/USAGE.md

-- Thanks to ibhagwan for the example to follow:
--- https://github.com/ibhagwan/nvim-lua

local colors = require 'colors'
local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

-- colors
local vi_mode_colors = {
  NORMAL = colors.skyblue,
  INSERT = colors.green,
  VISUAL = colors.yellow,
  OP = colors.cyan,
  BLOCK = colors.cyan,
  REPLACE = colors.red,
  ['V-REPLACE'] = colors.red,
  ENTER = colors.orange,
  MORE = colors.orange,
  SELECT = colors.yellow,
  COMMAND = colors.pink,
  SHELL = colors.pink,
  TERM = colors.pink,
  NONE = colors.purple
}

local lsp_get_diag = function(str)
  local count = lsp.diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

-- My components
local comps = {
  -- vi_mode -> NORMAL, INSERT..
  vi_mode = {
    left = {
      provider = function()
        return ' '..vi_mode_utils.get_vim_mode()..' '
      end,
      hl = function()
        return {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color(),
          bg = colors.black,
          style = 'bold'
        }
      end,
    }
  },
  -- right separator
  separator_right = {
    provider = '',
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
      }
    end,
  },
  -- parse file information
  file = {
    -- file icon
    icon = {
      provider = function()
        local filename = vim.fn.expand('%:t')
        local extension = vim.fn.expand('%:e')
        local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
        if icon == nil then
          icon = ''
        end
        return icon
      end,
      hl = function()
        local val = {}
        local filename = vim.fn.expand('%:t')
        local extension = vim.fn.expand('%:e')
        local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
        if icon ~= nil then
          val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
        else
          val.fg = 'skyblue'
        end
        val.fg = 'skyblue'
        return val
      end,
      left_sep = ' ',
      right_sep = ''
    },
    -- file name
    info = {
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative',
          file_modified_icon = ''
        }
      },
      hl = { fg = colors.skyblue },
      icon = '',
    },
    -- file type
    type = {
      provider = { name = 'file_type' },
    },
    -- line-column
    position = {
      provider = { name = 'position' },
      hl = {
        fg = colors.green,
        style = 'bold'
      },
      left_sep = ' ',
      right_sep = ' ',
    },
    -- simple scrollbar (inactive)
    scroll_bar = {
      provider = { name = 'scroll_bar' },
      hl = { fg = colors.fg },
      left_sep = ' ',
      right_sep = ' '
    },
  },
  -- LSP info
  diagnos = {
    err = {
      provider = 'diagnostic_errors',
      icon = '  : ',
      hl = { fg = colors.red },
    },
    warn = {
      provider = 'diagnostic_warnings',
      icon = '  : ',
      hl = { fg = colors.yellow },
    },
    info = {
      provider = 'diagnostic_info',
      icon = '  : ',
      hl = { fg = colors.green },
    },
    hint = {
      provider = 'diagnostic_hints',
      icon = '  : ',
      hl = { fg = colors.skyblue },
    },
  },
  -- git info
  git = {
    branch = {
      provider = 'git_branch',
      icon = '  ',
      hl = { fg = colors.pink },
      left_sep = ' ',
    },
    add = {
      provider = 'git_diff_added',
      icon = '  ',
      hl = { fg = colors.green },
      left_sep = ' ',
    },
    change = {
      provider = 'git_diff_changed',
      icon = '  ',
      hl = { fg = colors.orange },
      left_sep = ' ',
    },
    remove = {
      provider = 'git_diff_removed',
      icon = '  ',
      hl = { fg = colors.red },
      left_sep = ' ',
    }
  }
}

-- Get active/inactive components
--- see: https://github.com/famiu/feline.nvim/blob/master/USAGE.md#components
local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Left section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.separator_right)
table.insert(components.active[1], comps.file.icon)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.file.info)

-- Right Section
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.file.position)

-- call feline
require('feline').setup {
  components = components,
  vi_mode_colors = vi_mode_colors,
  theme = colors,
  colors = {
    bg = colors.bg,
    fg = colors.fg
  },
  force_inactive = {
    filetypes = {
      'NvimTree',
      'vista',
      'term'
    },
    buftypes = {},
  }
}
