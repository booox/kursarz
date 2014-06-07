class QuizSubmissionPolicy < Struct.new(:user, :quiz_submission)
  def create?
    user.is_signed_up_for?(quiz_submission.course)
  end
end
