class DisableArrayInCheckedAnswers < ActiveRecord::Migration
  def change
    remove_column :quiz_submissions, :checked_answers, :hstore, array: true
    add_column :quiz_submissions, :checked_answers, :hstore
  end
end
