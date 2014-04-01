class CreateCourseTeachers < ActiveRecord::Migration
  def change
    create_table :course_teachers do |t|
      t.integer :course_id, null: false
      t.integer :teacher_id, null: false

      t.timestamps
    end
  end
end
