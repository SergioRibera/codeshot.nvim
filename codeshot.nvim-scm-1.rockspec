local _MODREV, _SPECREV = 'scm', '-1'
rockspec_format = '3.0'
package = 'codeshot.nvim'
version = _MODREV .. _SPECREV

dependencies = {
  'lua >= 5.1',
}

test_dependencies = {
  'lua >= 5.1',
}

source = {
  url = 'git://github.com/SergioRibera/' .. package,
}

build = {
  type = 'builtin',
  -- TODO: Add runtime diretories here
  copy_directories = {
    'lua'
      -- 'doc',
      -- "plugin",
  },
}



