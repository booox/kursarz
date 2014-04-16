class UsersController < ApplicationController
  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to edit_user_path, notice: 'Profile updated successfully'
    else
      redirect_to edit_user_path, notice: 'Profile updated successfully'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :avatar_url)
  end
end
