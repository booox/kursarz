class Answer < ActiveRecord::Base
  belongs_to :question

  # def correct
  #   true
  # end
end
