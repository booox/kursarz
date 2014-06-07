class QuizzesController < ApplicationController
  before_action :set_course

  def new
    @quiz = @course.quizzes.build(user: current_user)
  end

  def create
    @quiz = @course.quizzes.build(quiz_params.merge(user: current_user))

    if @quiz.save
      redirect_to courses_path, notice: "You have successfully added a quiz."
    else
      redirect_to courses_path, error: "There was an error processing your request. Please try again later."
    end
  end

  def index
    @quizzes = @course.quizzes
  end

  def show
    @quiz = @course.quizzes.find(params[:id])
    @quiz_submissions = @quiz.quiz_submissions.by_user(current_user)
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end

  def quiz_params
    params.require(:quiz).permit(:name, :short_description, :description)
  end
end
