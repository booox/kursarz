class ChangeCourseRoleNameTypeToInteger < ActiveRecord::Migration
  def change
    remove_column :course_roles, :name, :string
    add_column :course_roles, :name, :integer
  end
end
