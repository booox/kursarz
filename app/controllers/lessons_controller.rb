class LessonsController < ApplicationController
  before_action :set_course

  def new
    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.create(lesson_params)
  end

  def index
    @lessons = @course.lessons
  end


  def show
    @lesson = @course.lessons.find(params[:id])
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id)
  end

  def lesson_params
    params.require(:lesson).permit(:name, :short_description, :description, :screenshot_url, :video_url)
  end
end
