chai = require 'chai'
chai.should()

x = require '../lib/is'
$ = require 'jquery'
reactivity = require 'reactivity'

# override
x $


describe.skip '$.is(":focus")', ->

  it 'should work', (done) ->
  
    e = $('<input>')
    e.attr type: 'text'

    e.is(':focus').should.equal no

    e.focus()

    process.nextTick ->

      e.is(':focus').should.equal yes
      done yes



describe '$.is(":checked")', ->

  it 'should work', ->
  
    e = $('<input>')
    e.attr type: 'checkbox'

    e.is(':checked').should.equal no

    e[0].checked = yes

    e.is(':checked').should.equal yes    
