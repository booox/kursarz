class AddCodeToAssignmentSubmissions < ActiveRecord::Migration
  def change
    add_column :assignment_submissions, :code, :text
  end
end
