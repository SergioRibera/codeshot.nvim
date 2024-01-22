local theme = require('codeshot.theme')

describe('Generate Args', function()
  it('Test theme from object', function()
    local default = {
      LineNr = { fg = '#fff', bg = '#323232' },
      Normal = { fg = '#fff', bg = '#323232' },
      Visual = { fg = '#fff', bg = '#323232' },
    }
    assert.are.same(theme.get(default), 'LineNr,#323232,#fff,;Normal,#323232,#fff,;Visual,#323232,#fff,;')
  end)

  it('Test generate hl from object', function()
    local default = {
      background = 2500134,
      foreground = 14334359,
    }
    assert.are.same(theme._gen_hl(default), {
      fg = '#dab997',
      bg = '#262626',
      style = '',
    })
  end)

  it('Test generate hl from incomplete object', function()
    local default = {
      background = 2500134,
    }
    assert.are.same(theme._gen_hl(default), {
      fg = '',
      bg = '#262626',
      style = '',
    })
  end)

  it('Test generate hl object with style', function()
    local default = {
      background = 2500134,
      underline = true,
    }
    assert.are.same(theme._gen_hl(default), {
      fg = '',
      bg = '#262626',
      style = 'underline',
    })
  end)

  it('Test theme from object with style', function()
    local default = {
      LineNr = { fg = '#fff', bg = '#323232', style = 'underline' },
      Normal = { fg = '#fff', bg = '#323232', style = 'bold' },
      Visual = { fg = '#fff', bg = '#323232', style = 'undercurl' },
    }
    assert.are.same(
      theme.get(default),
      'LineNr,#323232,#fff,underline;Normal,#323232,#fff,bold;Visual,#323232,#fff,undercurl;'
    )
  end)
end)
