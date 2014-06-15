class RenameAnswersToCheckedAnswersInQuizSubmissions < ActiveRecord::Migration
  def change
    rename_column :quiz_submissions, :answers, :checked_answers
  end
end
