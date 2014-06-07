class AddCoursesLimitToUser < ActiveRecord::Migration
  def change
    add_column :users, :courses_limit, :integer
  end
end
