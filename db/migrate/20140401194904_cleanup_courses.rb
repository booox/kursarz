class CleanupCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :screencast_url
    add_column :courses, :short_description, :string
  end
end
