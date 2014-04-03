class RenameTestsFileToTestsInAssignment < ActiveRecord::Migration
  def change
    rename_column :assignments, :tests_file, :tests
  end
end
