class CoursePolicy < Struct.new(:user, :course)
  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
