class AddStatusToAssignmentSubmission < ActiveRecord::Migration
  def change
    add_column :assignment_submissions, :status, :integer
  end
end
