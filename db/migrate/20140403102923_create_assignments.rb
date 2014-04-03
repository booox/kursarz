class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :short_description
      t.text :description
      t.integer :course_id
      t.string :screenshot_url
      t.string :tests_file

      t.timestamps
    end
  end
end
