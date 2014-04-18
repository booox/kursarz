class AssignmentSubmissionWorker
  include Sidekiq::Worker

  def perform(assignment_submission_id)
    @assignment_submission = AssignmentSubmission.find(assignment_submission_id)

    AssignmentChecker.new(@assignment_submission)
  end
end
