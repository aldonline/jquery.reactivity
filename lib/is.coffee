reactivity = require 'reactivity'
###
http://api.jquery.com/is/
###
module.exports = ( $ ) ->

  old = $.fn.is

  $.fn.is = ->

    if reactivity.active()
      
      switch arguments[0]
        
        when ':checked'
          notifier = reactivity()
          @on 'change', notifier
          notifier.once 'destroy', => @off 'change', notifier

        when ':focus'
          notifier = reactivity()
          @on 'focus', notifier
          @on 'blur', notifier
          notifier.once 'destroy', =>
            @off 'focus', notifier
            @off 'blur', notifier

    old.apply @, arguments