class AddExampleSolutionToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :example_solution, :text
  end
end
