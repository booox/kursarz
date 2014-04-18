class Assignment < ActiveRecord::Base
  LANGUAGES = ["ruby", "javascript", "python"].freeze

  belongs_to :course

  has_many :assignment_submissions
end
