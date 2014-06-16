class AddTotalScoreToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :total_score, :integer
  end
end
