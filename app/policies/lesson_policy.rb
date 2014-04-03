class LessonPolicy < Struct.new(:user, :lesson)
  def create?
    user.has_role?("admin") || user.is_teacher_in?(lesson.course)
  end

  def update?
    user.has_role?("admin")
  end

  def destroy?
    user.has_role?("admin")
  end
end
