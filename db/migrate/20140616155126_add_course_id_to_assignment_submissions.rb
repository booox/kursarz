class AddCourseIdToAssignmentSubmissions < ActiveRecord::Migration
  def change
    add_column :assignment_submissions, :course_id, :integer
  end
end
