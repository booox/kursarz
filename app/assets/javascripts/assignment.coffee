class Assignment
  constructor: ->
    @code_input = document.getElementById 'code'

    CodeMirror.fromTextArea @code_input,
      mode: 'text/x-ruby',
      theme: 'twilight',
      lineNumbers: true,
      styleActiveLine: true,
      matchBrackets: true

$ ->
  new Assignment()
