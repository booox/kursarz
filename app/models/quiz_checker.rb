class QuizChecker
  def initialize(params, current_user)
    @params = params
    @current_user = current_user
    @quiz = Quiz.find(params[:quiz_id])
  end

  def check
    score = 0

    checked_answers = {}

    @params.keys.each do |answer_id|
      answer = Answer.find(Integer(answer_id)) rescue next
      checked_answers.merge!(answer_id => answer_id)
      if answer.correct?
        score+=10
      else
        score-=10
      end
    end

    score = 0 if score < 0

    @quiz_submission = @quiz.quiz_submissions.new(score: score, checked_answers: checked_answers, user_id: @current_user.id)
    @quiz_submission.save

    @quiz_submission
  end

end
