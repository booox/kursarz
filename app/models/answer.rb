class Answer < ActiveRecord::Base
  belongs_to :answer

  def correct
    true
  end
end
