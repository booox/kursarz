class RevertNameToString < ActiveRecord::Migration
  def change
    remove_column :course_roles, :name, :integer
    add_column :course_roles, :name, :string
  end
end
