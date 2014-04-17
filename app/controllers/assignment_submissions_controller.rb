class AssignmentSubmissionsController < ApplicationController
  before_action :set_assignment
  before_action :set_assignment_submission

  def index
    @assignments = AssignmentSubmissions.all
  end

  def new
    @assignment_submission = @assignment.assignment_submissions.build
  end

  def create
    @assignment_submission = @assignment.assignment_submissions
      .create(assignment_submission_params)

    redirect_to course_assignment_assignment_submission_path(@course, @assignment, @assignment_submission)
  end

  def show
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def set_assignment_submission
    @assignment_submission = AssignmentSubmission.find(params[:id])
  end
end
