class RenameTestsToCodeInAssignment < ActiveRecord::Migration
  def change
    rename_column :assignments, :tests, :code
  end
end
