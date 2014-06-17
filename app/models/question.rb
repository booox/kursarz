class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  validates :content, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true

  def multiple_correct_answers?
    answers.where(correct: false).size > 1
  end
end
