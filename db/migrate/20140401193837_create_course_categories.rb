class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
      t.integer :course_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
