class QuizChecker
  def initialize(params, current_user)
    @params = params
    @current_user = current_user
    @quiz = Quiz.find(params[:quiz_id])
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

    score = 0 if score < 0

    @quiz.quiz_submissions.create!(score: score, user_id: @current_user.id)
  end

end
