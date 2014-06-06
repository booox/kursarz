require 'spec_helper'
require 'sidekiq/testing'

Sidekiq::Testing.fake!

describe AssignmentSubmissionWorker do
  it 'enqueues correctly' do
    assignment_submission = create(:assignment_submission, :ruby)

    expect{
      AssignmentSubmissionWorker.perform_async(assignment_submission.id)
    }.to change(AssignmentSubmissionWorker.jobs, :size).by(1)
  end

  it 'does its job' do
    assignment_submission = create(:assignment_submission, :ruby)

    assignment_checker = instance_double("AssignmentChecker")
    allow(assignment_checker).to receive(:check!)

    worker = AssignmentSubmissionWorker.new

    worker.perform(assignment_submission.id)
  end
end
