class CoursePolicy < Struct.new(:user, :course)
  def create?
    true
  end
end
