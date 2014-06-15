class CourseRolePolicy < Struct.new(:user, :course)
  def create?
    user.logged_in?
  end
end
