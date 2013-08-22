module.exports = ( jQuery ) ->
  $ = jQuery or window.jQuery
  unless $?
    throw new Error 'jquery.reactivity plugin must be applied to a jQuery instance'
  require('./val') $
  require('./is') $