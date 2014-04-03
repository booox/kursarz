class CourseSubsectionPolicy < Struct.new(:user, :subsection)
  def create?
    user.has_role?("admin") || user.is_teacher_in?(subsection.course)
  end

  def update?
    user.has_role?("admin")
  end

  def destroy?
    user.has_role?("admin")
  end
end
