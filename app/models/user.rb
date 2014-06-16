class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :assignments
  has_many :quizzes
  has_many :lessons

  has_many :lesson_shows
  has_many :assignment_submissions
  has_many :quiz_submissions

  has_many :course_roles
  has_many :student_roles, -> { where(name: 'student') }, class_name: 'CourseRole'
  has_many :teacher_roles, -> { where(name: 'teacher') }, class_name: 'CourseRole'

  has_many :courses
  has_many :teached_courses, through: :teacher_roles, source: :course
  has_many :signup_courses, through: :student_roles, source: :course

  def logged_in?
    true
  end

  def has_role?(name)
    roles.where(name: name).exists?
  end

  def is_teacher_in?(course)
    return if course.nil?
    teached_courses.exists?(id: course.id)
  end

  def teach_in(course)
    return false if is_teacher_in?(course)

    CourseRole.create_teacher_role(user: self, course: course).errors.empty?
  end

  def sign_up_for(course)
    return false if is_signed_up_for?(course)

    CourseRole.create_student_role(user: self, course: course).errors.empty?
  end

  def is_signed_up_for?(course)
    signup_courses.exists?(id: course.id)
  end

  def can_create_courses?
    courses_limit - courses.count > 0
  end

  def courses_limit
    super || 0
  end

  def score_in(course)
  end

  def completed(course)
    completed = 0
    completed += lesson_shows.where(course_id: course.id).count
    completed += assignment_submissions.where(course_id: course.id).select('assignment_id').uniq.count
    completed += quiz_submissions..where(course_id: course.id, select('quiz_id').uniq.count

    completed / course.completed
  end
end
