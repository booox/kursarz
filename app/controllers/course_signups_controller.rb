class CourseSignupsController < ApplicationController
	def create
		# @course = Course.find(params[:course_id])
		@course_role = CourseRole.new
		@course_role.user_id = current_user.id
		@course_role.course_id = params[:course_id]
		
		if @course_role.save
	      redirect_to courses_path, notice: "You've successfully signed up for course."
	    else
	      redirect_to courses_path, error: "There was an error processing your request. Please try again later."
	    end
	end
end
