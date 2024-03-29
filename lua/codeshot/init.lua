local option = require('codeshot.option')
local utils = require('codeshot.utils')
local codeshot = {}

_G.codeshot_settings = {}

local function run_sss_code(codeshot_options, opts)
  local extra_args = vim.tbl_extend('force', codeshot_options, opts)
  local output = { output = utils.replace_placeholders(extra_args.output) }
  local theme = {}

  if codeshot_options.use_current_theme then
    theme = { vim_theme = theme.get() }
  end

  local cmd = vim.tbl_extend(
    'keep',
    { opts.bin_path },
    utils.obj_to_args(extra_args, { 'bin_path', 'file', 'raw_input', 'use_current_theme' }),
    utils.obj_to_args(theme),
    utils.obj_to_args(output),
    -- TODO: support load code lines or file
    { opts.file }
  )
  vim.system(cmd, {})
end

function codeshot.take(file, extension, lines, hi_lines)
  local opts = option.get()
  run_sss_code(opts, { file = file, extension = extension, lines = lines, hi_lines = hi_lines })
end

function codeshot.current(lines, hi_lines)
  local curr = vim.fn.expand('%:p')
  local extension = vim.fn.expand('%:e')
  codeshot.take(curr, extension, lines, hi_lines)
end

function codeshot.selected_lines()
  local curr = vim.fn.expand('%:p')
  local extension = vim.fn.expand('%:e')
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local lines = s_start .. '..' .. s_end
  codeshot.take(curr, extension, lines, lines)
end

function codeshot.focus_selected_lines()
  local curr = vim.fn.expand('%:p')
  local extension = vim.fn.expand('%:e')
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  -- Calculate len of lines
  -- local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local hi_lines = s_start .. '..' .. s_end
  codeshot.take(curr, extension, '..', hi_lines)
end

function codeshot.setup(opts)
  option.set(opts)

  vim.api.nvim_create_user_command('SSFocused', codeshot.focus_selected_lines)
  vim.api.nvim_create_user_command('SSSelected', codeshot.focus_selected_lines)
end

return codeshot
