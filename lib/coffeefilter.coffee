CoffeeFilterView = require './coffeefilter-view'

module.exports =

  activate: (state) ->
    atom.commands.add 'atom-text-editor', 'coffeefilter:Strain', ->
      new CoffeeFilterView()

  deactivate: ->
