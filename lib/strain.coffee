CoffeeScript = require 'coffee-script'

module.exports =
  strain: () ->
    editor = atom.workspace.getActiveTextEditor()
    text = editor.getSelectedText() or editor.getText()
    output = CoffeeScript.compile text
    lines = output.split('\n')
    lines = lines.slice 1, lines.length - 3
    (line.slice 2 for line in lines).join '\n'
