class AssignmentChecker < Struct.new(:assignment_submission_id)
  def check!
    @assignment_submission = Assignment.find(assignment_submission_id)
    @assignment= @assignment_submission.assignment

    @assignment_submission.status, @assignment_submission.output = runner.run!
    @assignment_submission.save!
  end

  private

  def runner
    @runner ||= "#{@assignment.language.capitalize}AssignmentRunner"
      .constantize.new(assignment_id)
  end
end
