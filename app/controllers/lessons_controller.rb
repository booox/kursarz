class LessonsController < ApplicationController
  before_action :set_course

  def new
    @lesson = @course.lessons.build(user: current_user)
  end

  def create
    @lesson = @course.lessons.create(lesson_params.merge(user: current_user))

    if @lesson.save
      redirect_to course_path(@course), notice: "You have successfully added a lesson."
    else
      redirect_to course_path(@course), error: "There was an error processing your request. Please try again later."
    end
  end

  def index
    @lessons = @course.lessons
  end

  def show
    @lesson = @course.lessons.find(params[:id])
  end

  def destroy
    @course.lessons.find(params[:id]).destroy
    redirect_to course_path(@course), notice: 'Lesson successfully destroyed'
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :short_description, :description, :screenshot_url, :video_url)
  end
end
