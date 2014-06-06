require 'spec_helper'

describe AssignmentRunner do
  context 'ruby assignment runner' do

    it 'runs the assignment and gives its exit code
        \ assignment passed' do
      assignment = create(:assignment, :ruby)
      assignment_submission = create(:assignment_submission, :ruby, assignment: assignment)
      runner = RubyAssignmentRunner.new(assignment_submission)

      expect(runner.run![0]).to eq 0
    end

    it 'runs the assignment and gives its exit code
        \ assignment failed' do
      assignment = create(:assignment, :ruby)
      assignment_submission = create(:assignment_submission, :ruby_incorrect, assignment: assignment)
      runner = RubyAssignmentRunner.new(assignment_submission)

      expect(runner.run![0]).to eq 1
    end

  end

  context 'javascript assignment runner' do

    it 'runs the assignment and gives its exit code
        \ assignment passed' do
      assignment = create(:assignment, :javascript)
      expect(assignment.language).to eq "javascript"
      assignment_submission = create(:assignment_submission, :javascript, assignment: assignment)
      runner = JavascriptAssignmentRunner.new(assignment_submission)

      code, output = *runner.run!

      expect(code).to eq 0
    end

    it 'runs the assignment and gives its exit code
        \ assignment failed' do
      assignment = create(:assignment, :javascript)
      expect(assignment.language).to eq "javascript"
      assignment_submission = create(:assignment_submission, :javascript_incorrect, assignment: assignment)
      runner = JavascriptAssignmentRunner.new(assignment_submission)

      expect(runner.run![0]).to eq 1
    end

  end

  context 'coffeescript assignment runner' do

    it 'runs the assignment and gives its exit code
        \ assignment passed' do
      assignment = create(:assignment, :coffeescript)
      assignment_submission = create(:assignment_submission, :coffeescript, assignment: assignment)
      runner = CoffeescriptAssignmentRunner.new(assignment_submission)

      code, output = *runner.run!

      expect(code).to eq 0
    end

    it 'runs the assignment and gives its exit code
        \ assignment failed' do
      assignment = create(:assignment, :coffeescript)
      assignment_submission = create(:assignment_submission, :coffeescript_incorrect, assignment: assignment)
      runner = CoffeescriptAssignmentRunner.new(assignment_submission)

      expect(runner.run![0]).to eq 1
    end

  end
end
