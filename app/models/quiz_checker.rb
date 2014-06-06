class QuizChecker
  def initialize(params)
    @params = params
  end

  def check
    score = 0

    @params.keys.each do |answer_id|
      answer = Answer.find(Integer(answer_id)) rescue next
      score += 10 if answer.correct?
    end

    quiz_submission = QuizSubmission.create!(score: score)
  end

end
