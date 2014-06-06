class AssignmentSubmission
  constructor: ->
    code_input = document.getElementById 'code'

    @editor = CodeMirror.fromTextArea code_input,
      theme: 'twilight',
      lineNumbers: true,
      styleActiveLine: true,
      matchBrackets: true

    @editor.setOption "mode", window.assignmentLanguage

$ ->
  new AssignmentSubmission()
