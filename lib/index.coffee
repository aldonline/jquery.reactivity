###
There are several ways of using this module.
1. You can override common functions of a jQuery instance.
2. You can use a few handy methods
###

_val = require './val'
_is =  require './is'

module.exports = main = ( jQuery ) ->
  $ = jQuery or window.jQuery
  unless $?
    throw new Error 'jquery.reactivity plugin must be applied to a jQuery instance'
  _val.override $
  _is.override $

main.val = _val
main.is  = _is