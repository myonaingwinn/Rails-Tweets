class PasswordController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if Current.user.update(pwd_params)
      redirect_to root_path, notice: "Password updated successfully"
    else
      redirect_to edit_password_path, alert: "Password don't match!"
    end
  end

  def pwd_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
