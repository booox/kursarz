class LessonsController < ApplicationController
  before_action :set_course
  before_action :set_lesson, only: :show
  before_action :show_lesson, only: :show

  def index
    @lessons = @course.lessons
  end

  def new
    @lesson = @course.lessons.build(user: current_user)
  end

  def create
    @lesson = @course.lessons.create(lesson_params.merge(user: current_user))

    if @lesson.save
      redirect_to course_path(@course), notice: "You have successfully added a lesson."
    else
      render :new, error: "There was an error processing your request. Please try again later."
    end
  end

  def edit
    @lesson = @course.lessons.find(params[:id])
  end

  def update
    @lesson = @course.lessons.find(params[:id])

    if @lesson.update_attributes(lesson_params)
      redirect_to course_lesson_path(@course, @lesson), notice: "Lesson updated successfully"
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @course.lessons.find(params[:id]).destroy
    redirect_to course_path(@course), notice: 'Lesson successfully destroyed'
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end

  def set_lesson
    @lesson = @course.lessons.find(params[:id])
  end

  def show_lesson
    LessonShow.find_or_create_by(lesson: @lesson, course: @course, user: current_user)
  end

  def lesson_params
    params.require(:lesson).permit(:name, :short_description, :description, :screenshot_url, :video_url)
  end
end
