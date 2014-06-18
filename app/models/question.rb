class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  validates :content, presence: true

  validates :answers , length: { minimum: 1, message: "You must provide at least one answer" }

  accepts_nested_attributes_for :answers, allow_destroy: true

  def multiple_correct_answers?
    answers.where(correct: true).size > 1
  end
end
