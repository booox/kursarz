class AddPendingToAssignmentSubmission < ActiveRecord::Migration
  def change
    add_column :assignment_submissions, :pending, :boolean
  end
end
