CoffeeScript = require 'coffee-script'

module.exports =
  strain: () ->
    editor = atom.workspace.getActiveTextEditor()
    text = editor.getSelectedText() or editor.getText()
    CoffeeScript.compile text
