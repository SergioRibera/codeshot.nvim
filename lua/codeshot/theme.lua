local theme = {}

function theme._gen_hl(hl)
  local styles = { 'underline', 'undercurl', 'underdotted', 'bold', 'italic' }
  local style = ''

  for _, s in pairs(styles) do
    if hl[s] then
      style = s
      break
    end
  end

  return {
    bg = hl.background and string.format('#%06x', hl.background) or '',
    fg = hl.foreground and string.format('#%06x', hl.foreground) or '',
    style = style,
  }
end

--- Returns hex color of the value of the hig group
--- @param hl_name string hig group name
--- @return table highlight object value
function theme._hl(hl_name)
  local h = vim.api.nvim_get_hl_by_name(hl_name, true)
  return theme._gen_hl(h)
end

function theme._theme_obj()
  local groups = {
    'Normal',
    'LineNr',
    'Visual',
    'Cursor',
    'CursorLine',
    'Search',
    'SpellBad',
    'Title',
    'MatchParen',
    'IdentBlanklineChar',
    'Number',
    'Character',
    'String',
    'Constant',
    'Identifier',
    'Keyword',
    'Comment',
    'Operator',
    'Statement',
    'Type',
    'StorageClass',
    'Function',
  }
  local res = {}

  for _, g in ipairs(groups) do
    res[g] = theme._hl(g)
  end

  return res
end

function theme._fmt_theme(v)
  local res = ''
  -- Set background
  if v.bg and v.bg ~= '' then
    res = res .. v.bg
  end
  res = res .. ','
  -- Set foreground
  if v.fg and v.fg ~= '' then
    res = res .. v.fg
  end
  res = res .. ','
  -- Set Style
  if v.style and v.style ~= '' then
    res = res .. v.style
  end
  return res
end

function theme.get(t)
  local data = t or theme._theme_obj()
  local res = ''

  table.sort(data, function(a, b)
    return a:upper() < b:upper()
  end)

  for k, v in pairs(data) do
    res = res .. k .. ',' .. theme._fmt_theme(v) .. ';'
  end

  return res
end

return theme
