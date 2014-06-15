class ChangeCodeFromStringToTextInAssignments < ActiveRecord::Migration
  def change
    change_column :assignments, :code, :text
  end
end
