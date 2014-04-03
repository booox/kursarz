class CoursePolicy < Struct.new(:user, :course)
  def create?
    user.has_role?("admin") || user.has_role?("super_teacher")
  end

  def update?
    user.has_role?("admin")
  end

  def destroy?
    user.has_role?("admin")
  end
end
