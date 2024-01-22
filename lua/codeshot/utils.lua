local utils = {}

function utils.trim(s)
  return (string.gsub(s, '^%s*(.-)%s*$', '%1'))
end

function utils.obj_to_args(obj, ignores)
  local ignore = ignores or {}
  local res = {}
  -- local res = ""
  table.sort(obj, function(a, b)
    return a:upper() < b:upper()
  end)
  for k, v in pairs(obj) do
    if
      not (type(v) == 'string' and v == '' or type(v) == 'nil' or type(v) == 'boolean' and not v)
      and not vim.tbl_contains(ignore, k)
    then
      local prefix = k:len() > 1 and '--' or '-'
      table.insert(res, prefix .. k:gsub('show_', ''):gsub('_', '-'))
      -- res = res .. prefix .. k:gsub("show_", ""):gsub("_", "-")
      if type(v) ~= 'boolean' then
        table.insert(res, "'" .. v .. "'")
        -- res = res .. " '" .. v .. "'"
      end
    end
  end
  -- return utils.trim(res)
  return res
end

function utils.validate(from, to)
  for k, v in pairs(to) do
    if type(v) ~= type(from[k]) then
      error("Validation failed: for '" .. k .. "' we expected a value of type: '" .. type(from[k]) .. "'")
    end
  end
end

return utils
