class QuizSubmissionsController < ApplicationController
  before_action :set_course

  def create
    quiz_checker = QuizChecker.new(params, current_user)

    @quiz_submission = quiz_checker.check

    redirect_to course_quiz_path(@course, @quiz_submission.quiz), notice: "Your answers have been submitted and checked. Scroll down to see results."
  end

  def show
    @quiz_submission = QuizSubmission.by_user(current_user).find(params[:id])
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end
end
