class AssignmentPolicy < Struct.new(:user, :assignment)
  def create?
    user.has_role?("admin") || user.is_teacher_in?(assignment.course)
  end

  def update?
    user.has_role?("admin")
  end

  def destroy?
    user.has_role?("admin")
  end
end
