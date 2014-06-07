class AdminController < ApplicationController
  before_filter :authenticate_admin!

  def authenticate_admin!
    return unless current_user.admin?
  end
end
