# codeshot.nvim

**CodeShot** allows you to take screenshots of your code in
a very nice format and integrated in neovim

![out](https://github.com/SergioRibera/sss/assets/56278796/be74cd48-8f87-4544-98da-c7bc119753ab)

> [!IMPORTANT]
> This repository does not require constant updates but if you have any problems or feature suggestions open an [issue](https://github.com/SergioRibera/cmp-dotenv/issues) and I will be happy to check it out.
> 
> This project is basically a wrapper for the [sss_code](https://github.com/SergioRibera/sss/tree/main/crates/sss_code) terminal tool, as soon as the settings of that tool change, this plugin will be updated, in the meantime if you have any problems or suggestions, I will be happy to review your issue.

## Features

- **Blazing Fast!!** because it internally uses a tool to generate the images,
  this binary is blazing fast (Written in Rust)
- **beautiful** images of source code, saved to preferred place.
- **Highly Customizable**
- **copy** to clipboard

## Requirements

- Neovim >= 0.6.0
- [sss_code](https://github.com/SergioRibera/sss/tree/main/crates/sss_code)

## 📦 Installation

Install the plugin with your preferred package manager:

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
-- Lua
use {
  "SergioRibera/codeshot.nvim",
  config = function()
    require('codeshot').setup({})
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
" Vim Script
Plug 'SergioRibera/codeshot.nvim'

lua require('codeshot').setup({})
```

## ⚙️ Configuratioon

> [!IMPORTANT]
> If you have specific doubts about any configuration,
> you can check more details in the [`sss_code`](https://github.com/SergioRibera/sss/tree/main/crates/sss_code) repository.

silicon comes with the following defaults:

```lua
codeshot.setup {
  bin_path = 'sss_code', -- This may be required in case you have not added the binary to the $PATH
  -- %c = is a sss_code command generated
  -- Example to copy on wayland: "%c | wl-copy"
  copy = "%c", -- Format of custom command to run and copy output raw
  silent = true, -- Run command as Silent
  window_controls = false, --
  shadow = false, -- Enable Shadow
  shadow_image = false, -- Generate shadow from code theme
  show_line_numbers = true, -- Enable line numbers
  use_current_theme = true, -- Allows you to generate a screenshot taking the current neovim theme you have
  theme = '', -- Theme file to use. May be a path, or an embedded theme
  extra_syntaxes = '', -- Additional folder to search for .sublime-syntax files in
  tab_width = vim.opt.shiftwidth,
  fonts = vim.opt.guifont:replace(':h', '='):replace(':', '='), -- Lists of fonts to use
  background = '#323232', -- Background of image
  radius = 15, -- Rounded radius of code
  author = '', -- Leave your mark, add your name to the picture
  author_color = '#FFFFFF',
  window_title = '', -- The title that the code will have at the top next to the window controls
  window_title_background = '', -- The color for the window controls bar, if you leave it empty it will take the background of the theme
  window_title_color = '#FFFFFF',
  window_controls_width = 120, -- The maximum width for window controls
  window_controls_height = 40, -- The maximum Height for window controls
  titlebar_padding = 10, -- Text separation with window controls
  padding_x = 80, -- The x padding of the code with the image border
  padding_y = 100, -- The y padding of the code with the image border
  shadow_color = '#707070', -- Color for the shadow
  shadow_blur = 50, -- The level of blurring to be applied to the shadow
  save_format = 'png', -- The format in which the image will be saved [default: png]
  output = "CodeShot_${year}-${month}-${date}_${time}.png", -- Auto generate file name based on time (absolute or relative to cwd)
}
```

# Usage

## Keymaps

**Using commands**
```lua
-- Take screenshot just of selected lines
vim.keymap.set('v', '<Leader>s',  ":SSSelected" )
-- Take screenshot of file and highlight selected lines
vim.keymap.set('v', '<Leader>s',  ":SSFocused" )
```
**Call Lua Functions**
```lua
-- Take screenshot of file and highlight selected lines
codeshot.focus_selected_lines()
-- Take screenshot just of selected lines
codeshot.selected_lines()
-- It captures the current file but receives as parameters a value for the lines to capture and the lines to highlight.
-- lines, hi_lines: range of lines in `start..end` format
codeshot.current(lines, hi_lines)
-- It takes a capture of the file we pass it and receives as parameters a value for the lines to capture and the lines to highlight.
-- file: is a path to file
-- lines, hi_lines: range of lines in `start..end` format
codeshot.take(file, lines, hi_lines)
```
