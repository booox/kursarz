class AddQuizIdToQuizSubmissions < ActiveRecord::Migration
  def change
    add_column :quiz_submissions, :quiz_id, :integer
  end
end
