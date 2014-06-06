class QuizSubmissionsController < ApplicationController
  def create
    @quiz_submission = QuizChecker.new(params)

    @quiz_submission.check

    redirect_to root_url
  end
end
