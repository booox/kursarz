class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to edit_admin_user_path(@user), notice: "User updated successfully"
    else
      redirect_to edit_admin_user_path(@user), error: "Something went wrong. Try again later."
    end
  end

  private

  def user_params
    params.require(:user).permit(:admin, :courses_limit)
  end
end
