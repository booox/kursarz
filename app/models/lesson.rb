class Lesson < ActiveRecord::Base
	before_save :generate_screenshot_url

	private

	def generate_screenshot_url
		video_id = self.video_url.sub(/(\S)*watch\?v=/, "")
    	self.screenshot_url = "http://img.youtube.com/vi/#{ video_id }/0.jpg"
	end
end
