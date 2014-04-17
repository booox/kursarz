class AssigmentSubmissionCheckerWorker
  include Sidekiq::Worker

  def perform!(assignment_submission_id)
    @assignment_submission = AssignmentSubmission.find(assignment_submission_id)

    AssignmentSubmissionChecker.new(@assignment_submission)
  end
end
