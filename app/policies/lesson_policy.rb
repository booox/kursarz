class LessonPolicy < Struct.new(:user, :lesson)
  def create?
    user.admin? ||
      user.id == lesson.course.user_id ||
      user.is_teacher_in?(lesson.course)
  end

  def update?
    user.admin? ||
      user.id == lesson.course.user_id ||
      user.id == lesson.user_id
  end

  def destroy?
    user.admin? ||
      user.id == lesson.course.user_id ||
      user.id == lesson.user_id
  end
end
