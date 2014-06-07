class AssignmentPolicy < Struct.new(:user, :assignment)
  def create?
    user.admin? || user.is_teacher_in?(assignment.course)
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
