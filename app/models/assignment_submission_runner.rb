class AssignmentRunner < Struct.new(:assignment_id, :assignment_submission_id)
  def run!
    @assignment = Assignment.find(assignment_id)
    @assignment_submission = AssignmentSubmission.find(assignment_solution_id)
  end
end
