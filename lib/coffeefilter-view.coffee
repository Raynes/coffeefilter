{View, $} = require 'space-pen'
{strain} = require './strain'
CoffeeFilterErrorView = require './coffeefilter-error-view.coffee'

module.exports =
class CoffeeFilterView extends View
  @content: ->
    @div id: 'coffeefilter', =>
      @h2 "Compiled Coffeescript"
      @div id: 'editor', outlet: 'editor'

  showEditor: (editorModel, editor, text) ->
    editorModel.setText text
    editorModel.setCursorScreenPosition 0
    editorModel.setGrammar atom.grammars.grammarForScopeName('source.js')

    panel = atom.workspace.addModalPanel
      item: @
      visible: true

    editor.focus()

    $(@element).focusout (event) ->
      panel.hide()

    atom.commands.add @element,
      'core:cancel': (event) ->
        panel.hide()

  initialize: ->
    editor = document.createElement 'atom-text-editor'
    @editor.append editor
    editorModel = editor.getModel()
    try
      @showEditor editorModel, editor, strain()
    catch e
      new CoffeeFilterErrorView(e.message)
