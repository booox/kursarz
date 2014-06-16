class AddCourseIdToQuizSubmissions < ActiveRecord::Migration
  def change
    add_column :quiz_submissions, :course_id, :integer
  end
end
