local utils = require('codeshot.utils')
local option = {}

local defaults = {
  -- bin settings
  bin_path = 'sss_code',

  -- Screenshot flags
  copy = false,
  window_controls = false,
  shadow = false,
  shadow_image = false,

  -- Code Configs
  show_line_numbers = true,
  theme = '',
  extra_syntaxes = '',
  tab_width = vim.opt.shiftwidth,
  use_current_theme = true,

  -- Lib Configs
  fonts = vim.opt.guifont and vim.opt.guifont:replace(':h', '='):replace(':', '=') or '',
  background = '#323232',
  radius = 15,
  author = '',
  author_color = '#FFFFFF',
  window_title = '',
  window_title_background = '',
  window_title_color = '#FFFFFF',
  window_controls_width = 120,
  window_controls_height = 40,
  titlebar_padding = 10,
  padding_x = 80,
  padding_y = 100,
  shadow_color = '#707070',
  shadow_blur = 50,
  save_format = 'png',
  output = 'CodeShot_${year}-${month}-${date}_${time}.png',
}

function option.set(opts)
  utils.validate(defaults, opts)
  _G.codeshot_settings = opts
end

function option.get()
  return vim.tbl_deep_extend('keep', _G.codeshot_settings, defaults)
end

return option
