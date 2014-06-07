class CourseRole < ActiveRecord::Base
  NAME = ['student', 'teacher', 'head_teacher']

  validates_uniqueness_of :user_id, scope: [:course_id, :name]
  validates_inclusion_of :name, in: NAME

  belongs_to :course
  belongs_to :user

  def self.create_head_teacher_role(params = {})
    create(params.merge(name: 'head_teacher'))
  end

  def self.create_teacher_role(params = {})
    create(params.merge(name: 'teacher'))
  end

  def self.create_student_role(params = {})
    create(params.merge(name: 'student'))
  end
end
