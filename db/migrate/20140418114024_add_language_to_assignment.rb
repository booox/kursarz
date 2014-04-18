class AddLanguageToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :language, :string
  end
end
