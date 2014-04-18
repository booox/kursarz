class Assignment
  TEMPLATES =
    ruby: """
      describe 'the name of your test' do\n
        it 'should do something'\n
        # write your tests here\n
        end\n
      end
    """

    javascript: """
      describe(\"A suite\", function() { \n
        it(\"contains spec with an expectation\", function() { \n
          expect(true).toBe(true);\n
        });\n
      });
    """

    python: """
    import unittest

    class SimpleWidgetTestCase(unittest.TestCase):
        def setUp(self):
            self.widget = Widget('The widget')
    """

  constructor: ->
    code_input = document.getElementById 'code'
    @language_selector = $ '#assignment_language'

    @editor = CodeMirror.fromTextArea code_input,
      theme: 'twilight',
      lineNumbers: true,
      styleActiveLine: true,
      matchBrackets: true

    @language_selector.on "change", @change_language

    @editor.setOption "value", TEMPLATES["ruby"]
    @editor.setOption "mode", "ruby"

  change_language: () =>
    language = @language_selector.val()

    console.log language

    @editor.setOption "value", TEMPLATES[language]
    @editor.setOption "mode", language

$ ->
  new Assignment()
