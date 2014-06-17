class Quiz < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :questions
  has_many :answers
  has_many :quiz_submissions

  validates :name, presence: true
  validates :short_description, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :answers, allow_destroy: true

  def screenshot_url
    super || "holder.js/750x563/auto/sky/text:#{name}"
  end

  def score
    score = 0

    questions.each do |question|
      question.answers.each do |answer|
        score += 10 if answer.correct?
      end
    end

    score
  end
end
