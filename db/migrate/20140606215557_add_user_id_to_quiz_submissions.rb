class AddUserIdToQuizSubmissions < ActiveRecord::Migration
  def change
    add_column :quiz_submissions, :user_id, :integer
  end
end
