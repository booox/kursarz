class CreateLessonShows < ActiveRecord::Migration
  def change
    create_table :lesson_shows do |t|
      t.integer :user_id
      t.integer :lesson_id
    end
  end
end
