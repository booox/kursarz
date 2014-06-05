class Assignment
  TEMPLATES =
    ruby: """
      describe 'the name of your test' do
        it 'should do something' do
          # write your tests here
        end
      end
    """

    javascript: """
      describe("A suite", function() {
        it("contains spec with an expectation\", function() {
          expect(true).toBe(true);
        });
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
      matchBrackets: true,

    @language_selector.on "change", @change_language

    @change_language()

  change_language: () =>
    language = window.assignment_language or @language_selector.val()

    @editor.setOption "value", TEMPLATES[language]
    @editor.setOption "mode", language

$ ->
  new Assignment()
