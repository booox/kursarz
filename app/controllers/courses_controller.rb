class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by!(url: params[:id])
    @lessons = @course.lessons.all
    @assignments = @course.assignments.all
    @quizzes = @course.quizzes.all
    @course_role = CourseRole.new

    @assignment = @course.assignments.build
    @quiz = @course.quizzes.build
    @lesson = @course.lessons.build
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to courses_path, notice: "You've successfully added a course."
    else
      render :new, error: "There was an error processing your request. Please try again later."
    end
  end

  def edit
    @course = Course.find_by!(url: params[:id])

    @course_teacher = CourseRole.new

    @students = @course.students
    @teachers = @course.teachers
  end

  def update
    @course = Course.find_by!(url: params[:id])

    if @course.update(course_params)
      redirect_to courses_path, notice: "You've successfully updated course."
    else
      redirect_to courses_path, error: "There was an error processing your request. Please try again later."
    end
  end

  def destroy
    @course = Course.find_by!(url: params[:id])
    @course.destroy
    redirect_to courses_path, notice: "You've successfully destroyed course."
  end

  private

  def course_params
    params.require(:course).permit(:name, :short_description, :description, :screenshot_url)
  end
end
