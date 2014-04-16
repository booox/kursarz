class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.integer :quiz_id, null: false

      t.timestamps
    end
  end
end
