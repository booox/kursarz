require 'spec_helper'

describe AssignmentRunner do
  it 'initializes correctly' do
    assignment = create(:assignment)
    assignment_submission = create(:assignment_submission, assignment: assignment)
    runner = RubyAssignmentRunner.new(assignment_submission)
  end

  it 'runs the assignment and gives its exit code
      \ assignment passed' do
    assignment = create(:assignment)
    assignment_submission = create(:assignment_submission, assignment: assignment)
    runner = RubyAssignmentRunner.new(assignment_submission)

    expect(runner.run![0]).to eq 0
  end

  it 'runs the assignment and gives its exit code
      \ assignment failed' do
    assignment = create(:assignment)
    assignment_submission = create(:assignment_submission, :incorrect_submission, assignment: assignment)
    runner = RubyAssignmentRunner.new(assignment_submission)

    expect(runner.run![0]).to eq 1
  end
end
