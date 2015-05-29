{View} = require 'space-pen'

module.exports =
class CoffeeFilterErrorView extends View
  @content: (message) ->
    message = "An error occurred: #{message}"
    @div =>
      @div
        class: 'overlay from-bottom coffeefilter-error',
        outlet: 'messagePanel',
        =>
          @div class: 'panel-body padded error-message', message

  initialize: ->
    @messagePanel.on 'click', @detach
    atom.views.getView(atom.workspace).append(this)
    setTimeout (=> @detach()), 10000
