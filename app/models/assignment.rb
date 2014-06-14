class Assignment < ActiveRecord::Base
  LANGUAGES = ["ruby", "javascript", "python", "coffeescript"].freeze

  validates :name, presence: true
  validates :short_description, presence: true
  validates :description, presence: true
  validates :code, presence: true

  belongs_to :course
  belongs_to :user

  has_many :assignment_submissions

  def screenshot_url
    "holder.js/750x563/auto/sky/text:#{name}"
  end
end
