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
      render :new, error: "There was an error processing your request. Please try again later."
    end
  end

  def index
    @quizzes = @course.quizzes
  end

  def show
    @quiz = @course.quizzes.find(params[:id])
    @quiz_submission = @quiz.quiz_submissions.by_user(current_user).last
    @quiz_submissions = @quiz.quiz_submissions.by_user(current_user)
  end

  def destroy
    @course.quizzes.find(params[:id]).destroy
    redirect_to course_path(@course), notice: 'Quiz successfully destroyed'
  end

  private

  def normalize_nested_params(params)
    params["quiz"]["questions_attributes"].each do |question_attributes|
      question_attributes["answers_attributes"].each do |answer_attributes|
        answer_attributes["correct"] = answer_attributes.has_key?("correct")
      end
    end
  end

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end

  def quiz_params
    params.require(:quiz).permit(:name, :short_description, :description, questions_attributes: [:content, answers_attributes: [:correct, :content]])
  end
end
