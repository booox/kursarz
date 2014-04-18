class AssignmentChecker
  def initialize(assignment_submission)
    @assignment_submission = assignment_submission
    @assignment= @assignment_submission.assignment
  end

  def check!
    @assignment_submission.status, @assignment_submission.output = runner.run!
    @assignment_submission.pending = false
    @assignment_submission.save!
  end

  private

  def runner
    @runner ||= "#{@assignment.language.capitalize}AssignmentRunner"
      .constantize.new(@assignment_submission)
  end
end
