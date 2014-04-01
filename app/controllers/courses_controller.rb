class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    Course.find_by!(url: params[:id])
  end
end
