reactivity = require 'reactivity'

exports.notifevents = ( ctx, events, notifier ) ->
  if reactivity.active()
    notifier ?= reactivity()
    for e in events
      ctx.on e, notifier
    notifier.once 'destroy', ->
      for e in events
        ctx.off e, notifier