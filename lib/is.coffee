util = require './util'

###
http://api.jquery.com/is/
###

setup_notifier = ( $, type ) ->
    switch type
      when ':checked'
        util.notifevents $, ['change']
      when ':focus'
        util.notifevents $, ['focus', 'blur']

_is = ( $, type ) ->
  setup_notifier $, type
  $.is type

_is.override = ( $ ) ->
  old = $.fn.is
  $.fn.is = ->
    setup_notifier @, arguments[0]
    old.apply @, arguments

module.exports = _is