class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :course_roles
  has_many :courses, through: :course_roles

  has_many :teached_courses, -> { joins(:course_roles).where(course_roles: { name: 'teacher' } ) }, through: :course_roles, source: :course
  has_many :signup_courses, -> { joins(:course_roles).where(course_roles: { name: 'student' } ) }, through: :course_roles, source: :course

  def logged_in?
    true
  end

  def has_role?(name)
    roles.where(name: name).exists?
  end

  def is_teacher_in?(course)
    return if course.nil? || course.new_record?
    teached_courses.exists?(course: course.id)
  end

  def sign_up_for(course)
    return false if is_signed_up_for?(course)

    CourseRole.create_student_role(user: self, course: course).errors.empty?
  end

  def is_signed_up_for?(course)
    signup_courses.exists?(id: course.id)
  end
end
