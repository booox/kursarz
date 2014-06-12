class AddSampleSolutionToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :sample_solution, :text
  end
end
