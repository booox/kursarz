class AssignmentSubmission < ActiveRecord::Base
  enum status: [:passed, :failed]
  belongs_to :assignment

  after_create :check_assignment

  private

  def check_assignment
    AssignmentSubmissionWorker.perform_async(self.id)
  end
end
