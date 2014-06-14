class AssignmentsController < ApplicationController
  before_action :set_course

  def new
    @assignment = @course.assignments.build(user: current_user)
  end

  def create
    @assignment = @course.assignments.create(assignment_params.merge(user: current_user))

    if @assignment.save
      redirect_to course_path(@course), notice: "You have successfully added a assignment."
    else
      render :new
    end
  end

  def index
    @assignments = @course.assignments
  end

  def show
    @assignment = @course.assignments.find(params[:id])
    @assignment_submission = @assignment.assignment_submissions.build
    @assignment_submissions = @assignment.assignment_submissions.by_user(current_user)

    last_submission = @assignment.assignment_submissions.by_user(current_user).last

    @code = last_submission.try(:code)
    @sample_solution = @assignment.sample_solution
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :short_description, :description, :screenshot_url, :sample_solution, :code, :tests_file, :language)
  end
end
