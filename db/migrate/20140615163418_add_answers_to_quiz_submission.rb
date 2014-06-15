class AddAnswersToQuizSubmission < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION hstore'
    add_column :quiz_submissions, :answers, :hstore, array: true
  end
end
