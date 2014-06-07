class User::CoursesController < ApplicationController
  def index
    @courses = current_user.signup_courses
    @owned_courses = current_user.courses
    @teached_courses = current_user.teached_courses
  end
end
