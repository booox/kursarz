class Course < ActiveRecord::Base
  validates :name, presence: true
  validates :short_description, presence: true
  validates :description, presence: true

  acts_as_url :name

  has_many :lessons
  has_many :assignments
  has_many :quizzes

  has_many :course_roles

  has_many :student_roles, -> { where(course_roles: { name: 'student'})}, class_name: :CourseRole
  has_many :teacher_roles, -> { where(course_roles: { name: 'teacher'})}, class_name: :CourseRole

  has_many :students, through: :student_roles, source: :user
  has_many :teachers, through: :teacher_roles, source: :user

  def to_param
    url
  end

  # TODO: this method belongs to decorator
  def screenshot_url
    super || lessons.first.try(:screenshot_url) || "holder.js/750x563/auto/sky/text:#{name}"
  end
end
