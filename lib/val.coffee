reactivity = require 'reactivity'
###
http://api.jquery.com/val/
###
module.exports = ( $ ) ->

  old = $.fn.val

  $.fn.val = ->

    res = old.apply @, arguments

    if arguments.length is 0 # only reads are reactive
    
      if reactivity.active()

        notifier = reactivity()
        @on 'change', notifier
        @on 'input', notifier

        notifier.once 'destroy', =>
    
          @off 'change', notifier    
          @off 'input', notifier
    
    res