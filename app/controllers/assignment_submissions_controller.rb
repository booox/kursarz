class AssignmentSubmissionsController < ApplicationController
  before_action :set_course
  before_action :set_assignment
  before_action :set_assignment_submission, only: [:show]

  def index
    @assignments = AssignmentSubmissions.all
  end

  def new
    @assignment_submission = @assignment.assignment_submissions.build
  end

  def create
    @assignment_submission = @assignment.assignment_submissions
      .create(assignment_submission_params)

    redirect_to course_path(@course)
  end

  def show
  end

  private

  def set_course
    @course = Course.find_by!(url: params[:course_id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def set_assignment_submission
    @assignment_submission = AssignmentSubmission.find(params[:id])
  end

  def assignment_submission_params
    params.require(:assignment_submission).permit(:code)
  end
end
