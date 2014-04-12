class Course < ActiveRecord::Base
	validates :short_description, length: { maximum: 500 }
	validates :short_description, length: { maximum: 8000 }

  acts_as_url :name

  has_many :lessons
  has_many :assignments

  has_many :course_roles

  has_many :students, -> { joins(:course_roles).where(course_roles: { name: 'student' } ) }, through: :course_roles, source: :user
  has_many :teachers, -> { joins(:course_roles).where(course_roles: { name: 'teacher' } ) }, through: :course_roles, source: :user

  def to_param
    url
  end

  def screenshot_url
    super || lessons.first.try(:screenshot_url) || "holder.js/750x563/auto/sky/text:#{name}"
  end
end
