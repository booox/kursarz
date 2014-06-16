class AddCourseIdToLessonShows < ActiveRecord::Migration
  def change
    add_column :lesson_shows, :course_id, :integer
  end
end
