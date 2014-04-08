class CourseRole < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  def teacher
    user
  end
end
