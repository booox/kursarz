class QuizzesController < ApplicationController
  before_action :set_course

  def new
    @quiz = @course.quizzes.build(user: current_user)

    @question = @quiz.questions.build

    4.times do
      @question.answers.build
    end
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

  def edit
    @quiz = @course.quizzes.find(params[:id])
  end

  def update
    @quiz = @course.quizzes.find(params[:id])

    if @quiz.update(quiz_params)
      redirect_to course_quiz_path(@course, @quiz), notice: "You've successfully updated quiz."
    else
      render :edit, error: "There was an error processing your request. Please try again later."
    end
  end

  def show
    @quiz = @course.quizzes.find(params[:id])
    @questions = @quiz.questions.order('random()')
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
    params.require(:quiz).permit(:id, :name, :short_description, :description, questions_attributes: [:id, :content, :_destroy, answers_attributes: [:id, :correct, :content, :_destroy]])
  end
end
