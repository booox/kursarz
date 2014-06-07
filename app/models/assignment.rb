class Assignment < ActiveRecord::Base
  LANGUAGES = ["ruby", "javascript", "python", "coffeescript"].freeze

  belongs_to :course
  belongs_to :user

  has_many :assignment_submissions

  def screenshot_url
    "holder.js/750x563/auto/sky/text:#{name}"
  end
end
