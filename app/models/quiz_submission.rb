class QuizSubmission < ActiveRecord::Base
  belongs_to :quiz

  scope :by_user, -> (user) { where(user_id: user.id) }
end