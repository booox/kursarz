class AnonymousUser
  def id
    0
  end

  def logged_in?
    false
  end

  def admin?
    false
  end

  def can_create_courses?
    false
  end

  def is_signed_up_for?(course)
    false
  end

  def is_teacher_in?(course)
    false
  end
end
