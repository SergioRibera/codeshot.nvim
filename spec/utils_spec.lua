local utils = require('codeshot.utils')

describe('Generate Args', function()
  it('Test generate from object', function()
    local args = {
      b = true,
      boolean = false,
      str = 'Hola',
      str_empty = '',
      algo = nil,
      show_a = false,
    }
    assert.are.same(utils.obj_to_args(args), { '-b', '--str', "'Hola'" })
  end)

  it('Test ignore from object', function()
    local args = {
      b = true,
      boolean = false,
      str = 'Hola',
      str_empty = '',
      algo = nil,
      show_a = false,
    }
    local ignore = { 'b' }
    assert.are.same(utils.obj_to_args(args, ignore), { '--str', "'Hola'" })
  end)
end)
