class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :course_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.string :screenshot_url
      t.string :video_url

      t.timestamps
    end
  end
end
