class LessonShow < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :course
end
