class AssignmentSubmissionWorker
  include Sidekiq::Worker

  def perform(assignment_submission_id)
    @assignment_submission = AssignmentSubmission.find(assignment_submission_id)

    assignment_checker = AssignmentChecker.new(@assignment_submission)

    assignment_checker.check!
  end
end
