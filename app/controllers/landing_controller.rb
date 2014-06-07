class LandingController < ApplicationController
  layout "landing"

  before_action :skip_landing_if_logged

  def show
  end

  private

  def skip_landing_if_logged
    redirect_to courses_path if current_user.logged_in?
  end
end
