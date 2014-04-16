class RenameTecherToRole < ActiveRecord::Migration
  def change
  	rename_table :course_teachers, :course_roles
  end
end
