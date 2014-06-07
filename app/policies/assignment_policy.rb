class AssignmentPolicy < Struct.new(:user, :assignment)
  def create?
    user.admin? ||
      user.id == assignment.course.user_id ||
      user.is_teacher_in?(assignment.course)
  end

  def update?
    user.admin? ||
      user.id == assignment.course.user_id ||
      user.id == assignment.user_id
  end

  def destroy?
    user.admin? ||
      user.id == assignment.course.user_id ||
      user.id == assignment.user_id
  end
end
