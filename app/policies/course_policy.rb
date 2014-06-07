class CoursePolicy < Struct.new(:user, :course)
  def create?
    user.admin? || user.can_create_courses?
  end

  def show?
    user.admin? || user.is_signed_up_for?(course)
  end

  def update?
    user.admin? || course.user_id == user.id
  end

  def destroy?
    user.admin? || course.user_id == user.id
  end
end
