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

describe('Validation objects', function()
  it('Basic test', function()
    local default = {
      b = true,
      boolean = false,
      str = 'Hola',
      str_empty = '',
      algo = nil,
      show_a = false,
    }

    local rcv = {
      str = 'Hola',
      str_empty = '',
      algo = nil,
      show_a = false,
    }
    utils.validate(default, rcv)
  end)

  it('Bad Types', function()
    local default = {
      name = 'Hola',
    }

    local rcv = {
      name = false,
    }

    local res = function()
      utils.validate(default, rcv)
    end
    assert.has_error(res, "Validation failed: for 'name' we expected a value of type: 'string'")
  end)
end)
