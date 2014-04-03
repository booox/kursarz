class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :course_teachers
  has_many :courses, source: :course_teachers

  def logged_in?
    true
  end

  def has_role?(name)
    roles.where(name: name).exists?
  end

  def is_teacher_in?(course)
    return if course.nil? || course.new_record?
    courses.pluck(:id).include?(course.id)
  end
end
