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
  theme = nil,
  extra_syntaxes = nil,
  tab_width = vim.opt.shiftwidth,

  -- Lib Configs
  fonts = vim.opt.guifont:replace(':h', '='):replace(':', '='),
  background = '#323232',
  radius = 15,
  author = nil,
  author_color = '#FFFFFF',
  window_title = nil,
  window_title_background = '#4287f5',
  window_title_color = '#FFFFFF',
  window_controls_width = 120,
  window_controls_height = 40,
  titlebar_padding = 10,
  padding_x = 80,
  padding_y = 100,
  shadow_color = '#707070',
  shadow_blur = 50,
  save_format = 'png',
}

function option.set(opts)
  vim.validate {
    bin_path = { opts.bin_path, 'string' },
    copy = { opts.copy, 'boolean' },
    window_controls = { opts.window_controls, 'boolean' },
    shadow = { opts.shadow, 'boolean' },
    shadow_image = { opts.shadow_image, 'boolean' },
    show_line_numbers = { opts.show_line_numbers, 'boolean' },
    theme = { opts.theme, 'string' },
    extra_syntaxes = { opts.extra_syntaxes, 'string' },
    tab_width = { opts.tab_width, 'int' },
    fonts = { opts.fonts, 'string' },
    background = { opts.background, 'string' },
    radius = { opts.radius, 15 },
    author = { opts.author, 'string' },
    author_color = { opts.author_color, 'string' },
    window_title = { opts.window_title, 'string' },
    window_title_background = { opts.window_title_background, 'string' },
    window_title_color = { opts.window_title_color, 'string' },
    window_controls_width = { opts.window_controls_width, 'int' },
    window_controls_height = { opts.window_controls_height, 'int' },
    titlebar_padding = { opts.titlebar_padding, 'int' },
    padding_x = { opts.padding_x, 'int' },
    padding_y = { opts.padding_y, 'int' },
    shadow_color = { opts.shadow_color, 'string' },
    shadow_blur = { opts.shadow_blur, 'int' },
    save_format = { opts.save_format, 'string' },
  }
  _G.codeshot_settings = opts
end

function option.get()
  return vim.tbl_deep_extend('keep', _G.codeshot_settings, defaults)
end

return option
