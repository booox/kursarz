# Override the default renderer to add syntax highlighting with Pygments.
class PygmentsHTML < Redcarpet::Render::HTML
  def block_code code, language
    Pygments.highlight code, :lexer => language
  end
end

$markdown = Redcarpet::Markdown.new(PygmentsHTML,
                                    :tables => true,
                                    :fenced_code_blocks => true,
                                    :autolink => true
                                   )

