class QuizSubmissionsController < ApplicationController
  def create
    @quiz_submission = QuizChecker.new(params, current_user)

    @quiz_submission.check

    redirect_to root_url
  end

  def show
    @quiz_submission = QuizSubmission.by_user(current_user).find(params[:id])
  end
end
