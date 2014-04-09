class CourseRole < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => [:course_id]

  belongs_to :course
  belongs_to :user

  def teacher
    user
  end
end
