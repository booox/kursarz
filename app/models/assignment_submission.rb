class AssignmentSubmission < ActiveRecord::Base
  enum status: [:passed, :failed]
  belongs_to :user
  belongs_to :course
  belongs_to :assignment

  scope :by_user, -> (user) { where(user_id: user.id) }
  scope :by_course, -> (user) { where(course_id: course_id) }

  after_create :check_assignment

  private

  def check_assignment
    AssignmentSubmissionWorker.perform_async(self.id)
  end
end
