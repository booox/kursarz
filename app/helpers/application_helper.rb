module ApplicationHelper
  def render_markdown(markdown)
    raw($markdown.render(markdown))
  end
end
