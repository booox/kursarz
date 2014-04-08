class UserRoleMigration < ActiveRecord::Migration
  def change
  	add_column :course_roles, :user_id, :integer
  	remove_column :course_roles, :teacher_id
  end
end
