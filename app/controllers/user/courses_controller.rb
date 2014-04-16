class User::CoursesController < ApplicationController
  def index
    @courses = current_user.signup_courses
  end
end
