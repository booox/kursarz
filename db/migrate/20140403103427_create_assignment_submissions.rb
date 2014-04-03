class CreateAssignmentSubmissions < ActiveRecord::Migration
  def change
    create_table :assignment_submissions do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.text :output

      t.timestamps
    end
  end
end
