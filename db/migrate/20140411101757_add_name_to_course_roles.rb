class AddNameToCourseRoles < ActiveRecord::Migration
  def change
    add_column :course_roles, :name, :string
  end
end
