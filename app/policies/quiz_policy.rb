class QuizPolicy < Struct.new(:user, :quiz)
  def create?
    user.admin? ||
      user.id == quiz.course.user_id ||
      user.is_teacher_in?(quiz.course)
  end

  def update?
    user.admin? ||
      user.id == quiz.course.user_id ||
      user.id == quiz.user_id
  end

  def destroy?
    user.admin? ||
      user.id == quiz.course.user_id ||
      user.id == quiz.user_id
  end
end
