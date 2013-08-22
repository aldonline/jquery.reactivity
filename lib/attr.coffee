reactivity = require 'reactivity'
###
http://api.jquery.com/attr/

.attr( attributeName )
.attr( attributeName )
.attr( attributeName, value )
.attr( attributeName, value )
.attr( attributes )
.attr( attributeName, function(index, attr) )
###
module.exports = ( $ ) ->

  old = $.fn.attr

  $.fn.attr = ->

    res = old.apply @, arguments

    if arguments.length is 1 # only reads are reactive
    
      if reactivity.active()

        notifier = reactivity()

        @on 'change', notifier
        @on 'input', notifier

        notifier.once 'destroy', =>
    
          @off 'change', notifier    
          @off 'input', notifier
    
    res