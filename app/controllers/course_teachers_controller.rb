class CourseTeachersController < ApplicationController
  def create
    @course = Course.find_by!(url: params[:course_id])

    if current_user.teach_in(@course)
      redirect_to edit_course_path(@course), notice: "You've successfully signed up for course."
    else
      redirect_to edit_course_path(@course), error: "There was an error processing your request. Please try again later."
    end
  end

  def destroy
    @course_teacher = current_user.teacher_roles.find_by!(course_id: params[:id])

    @course_teacher.destroy
    redirect_to courses_path, notice: "You've successfully leave for course."
  end
end
