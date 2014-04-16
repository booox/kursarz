class AssignmentsController < ApplicationController
  before_action :set_course

  def new
    @assignment = @course.assignments.build
  end

  def create
    @assignment = @course.assignments.create(assignment_params)

    if @assignment.save
      redirect_to course_path(@course), notice: "You have successfully added a assignment."
    else
      redirect_to course_path(@course), error: "There was an error processing your request. Please try again later."
    end
  end

  def index
    @assignments = @course.assignments
  end

  def show
    @assignment = @course.assignments.find(params[:id])
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :short_description, :description, :screenshot_url, :tests_file)
  end
end
