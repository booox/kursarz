class LessonsController < ApplicationController
  before_action :set_course

  def new
    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.create(lesson_params)
    video_id = @lesson.video_url.sub(/(\S)*watch\?v=/, "")
    @lesson.screenshot_url = "http://img.youtube.com/vi/#{ video_id }/0.jpg"

    if @lesson.save
      redirect_to courses_path, notice: "You have successfully added a lesson."
    else
      redirect_to courses_path, error: "There was an error processing your request. Please try again later."
    end
  end

  def index
    @lessons = @course.lessons
  end


  def show
    @lesson = @course.lessons.find(params[:id])
  end

  private

  def set_course
    @course = Course.find_by!(id: params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :short_description, :description, :screenshot_url, :video_url)
  end
end
