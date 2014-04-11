class CourseSignupsController < ApplicationController
  def create
    @course = Course.find_by!(url: params[:course_id])

    if current_user.sign_up_for(@course)
      redirect_to courses_path, notice: "You've successfully signed up for course."
    else
      redirect_to courses_path, error: "There was an error processing your request. Please try again later."
    end
  end
end
