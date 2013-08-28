util       = require './util'

###
http://api.jquery.com/val/
###
setup_notifier = ( ctx ) -> util.notifevents ctx, ['change', 'input']

val = ( $ ) ->
  res = $.val()
  setup_notifier $
  res

val.override = ( $ ) ->
  old = $.fn.val
  $.fn.val = ->
    res = old.apply @, arguments
    if arguments.length is 0 # only reads are reactive
      setup_notifier @
    res

module.exports = val