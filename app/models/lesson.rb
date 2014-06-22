class Lesson < ActiveRecord::Base
  before_save :generate_screenshot_url
  belongs_to :course
  belongs_to :user

  validates :name, presence: true
  validates :short_description, presence: true
  validates :description, presence: true

  has_many :lesson_shows, dependent: :destroy

  def video_id
    self.video_url.sub(/(\S)*watch\?v=/, "")
  end

  private

  def generate_screenshot_url
    self.screenshot_url = "http://img.youtube.com/vi/#{video_id}/0.jpg"
  end
end
