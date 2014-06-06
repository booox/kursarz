class QuizChecker
  def initialize(params)
    @params = params
  end

  def check
    score = 0

    @params.keys.each do |answer_id|
      answer = Answer.find(Integer(answer_id)) rescue next
      if answer.correct?
        score+=10
      else
        score-=10
      end
    end

    quiz_submission = QuizSubmission.create!(score: score)
  end

end
