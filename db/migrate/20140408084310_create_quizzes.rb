class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name, null: false
      t.string :short_description, null: false
      t.text :description
      t.integer :course_id, null: false

      t.timestamps
    end
  end
end
