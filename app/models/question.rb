class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  accepts_nested_attributes_for :answers

  def multiple_correct_answers?
    answers.where(correct: false).size > 1
  end
end
