module ApplicationHelper
  def render_markdown(markdown)
    raw($markdown.render(markdown))
  end

  def youtube_iframe(video_id)
    raw %Q{
      <iframe id="ytplayer" type="text/html" width="640" height="390"
      src="http://www.youtube.com/embed/#{video_id}?autoplay=1&origin=http://example.com"
      frameborder="0"/>
    }
  end
end
