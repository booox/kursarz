class QuizSubmission < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :course

  scope :by_user, ->(user){ where(user_id: user.id) }
  scope :by_course, ->(course){ where(course_id: course.id) }

  store_accessor :checked_answers
end
