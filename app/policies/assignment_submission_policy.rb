class AssignmentSubmissionPolicy < Struct.new(:user, :assignment_submission)
  def create?
    user.is_signed_up_for(assignment_submission.course)
  end
end
