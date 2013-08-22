chai = require 'chai'
chai.should()

x = require '../lib/val'
$ = require 'jquery'
reactivity = require 'reactivity'

# override
x $

describe '$.val()', ->

  it 'should work', ->
  
    e = $('<input>')
    e.attr type: 'text'
    
    e.val().should.equal ''
    e.val 'hello'
    e.val().should.equal 'hello'

    results = []
    reactivity (-> e.val()), (e, r, m, s) -> results.push arguments

    results.should.have.length 1
    results[0][1].should.equal 'hello'

    e.val('bye').change()
    results.should.have.length 2
    results[1][1].should.equal 'bye'

    e.val('foo').change()
    results.should.have.length 3
    results[2][1].should.equal 'foo'