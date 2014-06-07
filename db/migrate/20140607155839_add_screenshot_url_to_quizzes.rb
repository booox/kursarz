class AddScreenshotUrlToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :screenshot_url, :string
  end
end
