class Course < ActiveRecord::Base
	validates :short_description, length: { maximum: 500 }
	validates :short_description, length: { maximum: 8000}

  acts_as_url :name

  has_many :lessons
  has_many :assignments

  def to_parm
    url
  end

  def screenshot_url
    super || "holder.js/400x300/sky/text:#{name}"
  end
end
