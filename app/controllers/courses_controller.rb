class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by!(url: params[:id])
    @lessons = @course.lessons
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path, notice: "You've successfully added a course."
    else
      redirect_to courses_path, error: "There was an error processing your request. Please try again later."
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :short_description, :description)
  end
end
