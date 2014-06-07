class LessonPolicy < Struct.new(:user, :lesson)
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
