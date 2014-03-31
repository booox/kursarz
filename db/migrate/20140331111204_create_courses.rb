class CreateCourses < ActiveRecord::Migration def change
    create_table :courses do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.text :description
      t.string :screenshot_url
      t.string :screencast_url

      t.timestamps
    end
  end
end
