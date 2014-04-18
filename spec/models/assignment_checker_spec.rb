require 'spec_helper'

describe AssignmentChecker do
  it 'creates updates assignment submission' do
    assignment = create(:assignment)
    assignment_submission = create(:assignment_submission, assignment: assignment)

    checker = AssignmentChecker.new(assignment_submission)

    checker.check!

    assignment_submission.reload

    expect(assignment_submission.passed?).to eq true
  end
end
